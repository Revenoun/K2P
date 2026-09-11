#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 2-设置管理地址  
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate 

find package/lean/mt/drivers/mt7615d -name "rt_linux.h" -exec \
  sed -i 's|#include <linux/unaligned.h>|#include <asm/unaligned.h>|g' {} \;
