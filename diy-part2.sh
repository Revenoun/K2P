#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# 注意：本脚本由 workflow 在「仓库根目录」执行，
#       因此所有路径都基于 openwrt/ 子目录。

set -euo pipefail

echo ">>> [diy-part2] 当前目录: $(pwd)"

# 切到 openwrt 源码目录
cd openwrt

# ---------- 1. 设置管理地址 192.168.2.1 ----------
CONFIG_GEN="package/base-files/files/bin/config_generate"
if [ -f "$CONFIG_GEN" ]; then
  sed -i 's/192\.168\.1\.1/192.168.2.1/g' "$CONFIG_GEN"
  echo ">>> 管理地址已改为 192.168.2.1"
  grep -n "192.168.2.1" "$CONFIG_GEN" || true
else
  echo "!!! 未找到 $CONFIG_GEN"
  exit 1
fi

# ---------- 2. 修复 mt7615d 驱动的 unaligned.h 头文件 ----------
MT7615D_DIR="package/lean/mt/drivers/mt7615d"

if [ -d "$MT7615D_DIR" ]; then
  echo ">>> 查找 rt_linux.h ..."
  mapfile -t RT_FILES < <(find "$MT7615D_DIR" -type f -name "rt_linux.h" 2>/dev/null || true)

  if [ "${#RT_FILES[@]}" -eq 0 ]; then
    echo "!!! 未找到 rt_linux.h，跳过 unaligned.h 修复"
  else
    for f in "${RT_FILES[@]}"; do
      echo "    处理: $f"
      sed -i -E 's|#include <linux/unaligned\.h>|#include <asm/unaligned.h>|g' "$f"
    done
    echo ">>> unaligned.h 修复完成，当前匹配行："
    grep -Rn "unaligned.h" "$MT7615D_DIR" || true
  fi
else
  echo "!!! 未找到 $MT7615D_DIR，跳过驱动修复"
fi

echo ">>> [diy-part2] 完成"
