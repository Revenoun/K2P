#!/bin/bash
set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OPENWRT_DIR="$REPO_ROOT/openwrt"
MT7615D_DIR="$OPENWRT_DIR/package/lean/mt/drivers/mt7615d"
RT_LINUX="$MT7615D_DIR/src/mt_wifi/os/linux/rt_linux.c"
PATCH_FILE="$REPO_ROOT/mt7615d-rt_linux.patch"

if [ -f "$RT_LINUX" ]; then
    echo ">>> [diy2] 找到 $RT_LINUX"
    if [ -f "$PATCH_FILE" ]; then
        patch -p1 -d "$MT7615D_DIR" < "$PATCH_FILE" \
            || echo ">>> [diy2] patch 失败或已打过，继续构建"
    else
        echo ">>> [diy2] 补丁 $PATCH_FILE 不存在，跳过"
    fi
else
    echo ">>> [diy2] 未找到 $RT_LINUX，跳过打补丁"
fi
