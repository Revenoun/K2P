#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 2-设置管理地址  
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate 

# 在 diy-part2.sh 或编译前的准备步骤中添加：
#sed -i 's|#include <linux/unaligned.h>|#include <asm/unaligned.h>|g' package/lean/mt/drivers/mt7615d/src/mt_wifi/include/os/rt_linux.h


