#!/bin/bash
# diy2/part1.sh - 自动修复 mt7615d 驱动在内核 5.15+ 下的编译问题

set -e

# 定位驱动源码目录（根据你的实际仓库路径调整）
MT7615D_SRC="$OPENWRT_DIR/package/lean/mt/drivers/mt7615d/src/mt_wifi/os/linux"
TARGET_FILE="$MT7615D_SRC/rt_linux.c"

# 如果源码不存在则跳过
if [ ! -f "$TARGET_FILE" ]; then
    echo "[diy2] mt7615d rt_linux.c not found, skip patch."
    exit 0
fi

echo "[diy2] Patching mt7615d rt_linux.c for kernel 5.15+ ..."

# 仅当存在 get_fs/set_fs 时才修复，避免重复执行
if grep -q "get_fs\|set_fs" "$TARGET_FILE"; then
    # 备份一次
    [ -f "${TARGET_FILE}.bak" ] || cp "$TARGET_FILE" "${TARGET_FILE}.bak"

    # 删除所有 get_fs / set_fs 调用
    sed -i -e '/get_fs()/d' \
           -e '/set_fs(KERNEL_DS)/d' \
           -e '/set_fs(pOSFSInfo->fs)/d' \
           -e '/set_fs(orig_fs)/d' \
           "$TARGET_FILE"

    # 如果 orig_fs 声明已无用，删除之
    if ! grep -q "orig_fs" "$TARGET_FILE"; then
        sed -i '/mm_segment_t orig_fs;/d' "$TARGET_FILE"
    fi

    echo "[diy2] mt7615d patch applied successfully."
else
    echo "[diy2] mt7615d already patched, nothing to do."
fi
