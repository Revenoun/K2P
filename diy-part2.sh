#!/bin/bash
set -e

echo ">>> [diy2] 进入 openwrt 目录"
cd openwrt

MT7615D_DIR="package/lean/mt/drivers/mt7615d"
RT_LINUX="$MT7615D_DIR/src/mt_wifi/os/linux/rt_linux.c"
PATCH_FILE="../mt7615d-rt_linux.patch"

if [ -f "$RT_LINUX" ]; then
    echo ">>> [diy2] 找到 $RT_LINUX，开始打补丁"
    if [ -f "$PATCH_FILE" ]; then
        patch -p1 -d "$MT7615D_DIR" < "$PATCH_FILE" \
            || echo ">>> [diy2] patch 应用失败或已打过，继续"
    else
        echo ">>> [diy2] 补丁文件 $PATCH_FILE 不存在，跳过"
    fi
else
    echo ">>> [diy2] 未找到 $RT_LINUX，跳过打补丁"
fi
