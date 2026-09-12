#!/bin/bash
#
# diy-part2.sh
# 在 feeds 安装后、正式编译前执行
#

set -e

# 驱动源码所在路径（根据你的日志确定）
RT_LINUX_H="build_dir/target-mipsel_24kc_musl/linux-ramips_mt7621/mt7615d-5.0.4.0/mt_wifi/include/os/rt_linux.h"

# 等待源码目录出现（首次编译时可能需要一点时间）
for i in $(seq 1 30); do
    if [ -f "$RT_LINUX_H" ]; then
        break
    fi
    echo "[diy-part2] 等待驱动源码解压: $i/30"
    sleep 5
done

if [ ! -f "$RT_LINUX_H" ]; then
    echo "[diy-part2] 未找到 rt_linux.h，跳过修改"
    exit 0
fi

# 备份原文件
cp -f "$RT_LINUX_H" "${RT_LINUX_H}.bak"

# 将 <linux/unaligned.h> 替换为 <asm/unaligned.h>
sed -i 's|#include <linux/unaligned.h>|#include <asm/unaligned.h>|g' "$RT_LINUX_H"

echo "[diy-part2] 已修改 rt_linux.h："
grep -n "unaligned.h" "$RT_LINUX_H" || true
