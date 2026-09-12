#!/bin/bash
set -e

echo "[diy-part2] 开始修复 mt7615d unaligned.h"

cd openwrt

# 用 find 自动定位，避免路径写死
RT_LINUX_H=$(find build_dir -path "*mt7615d*/mt_wifi/include/os/rt_linux.h" 2>/dev/null | head -n 1)

if [ -z "$RT_LINUX_H" ]; then
    echo "[diy-part2] 未找到 rt_linux.h，可能是首次编译尚未解压，跳过"
    exit 0
fi

echo "[diy-part2] 找到文件: $RT_LINUX_H"

# 备份
cp -f "$RT_LINUX_H" "${RT_LINUX_H}.bak"

# 替换
sed -i 's|#include <linux/unaligned.h>|#include <asm/unaligned.h>|g' "$RT_LINUX_H"

echo "[diy-part2] 修改后内容："
grep -n "unaligned.h" "$RT_LINUX_H" || true

echo "[diy-part2] 完成"
