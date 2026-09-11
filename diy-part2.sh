#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 2-设置管理地址  
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate 

# 在 diy-part2.sh 或编译前的准备步骤中添加：
#sed -i 's|#include <linux/unaligned.h>|#include <asm/unaligned.h>|g' package/lean/mt/drivers/mt7615d/src/mt_wifi/include/os/rt_linux.h


# 关闭与 mt7615d 冲突的 dbdc 选项，解决编译报错
sed -i 's/^CONFIG_PACKAGE_kmod-mt7615d_dbdc=y/# CONFIG_PACKAGE_kmod-mt7615d_dbdc is not set/' .config
# 如果原来没有这行，直接追加关闭项
grep -q "CONFIG_PACKAGE_kmod-mt7615d_dbdc" .config || echo "# CONFIG_PACKAGE_kmod_mt7615d_dbdc is not set" >> .config

# 确保主驱动保持开启
sed -i 's/^# CONFIG_PACKAGE_kmod-mt7615d is not set/CONFIG_PACKAGE_kmod-mt7615d=y/' .config
grep -q "CONFIG_PACKAGE_kmod-mt7615d=" .config || echo "CONFIG_PACKAGE_kmod-mt7615d=y" >> .config

