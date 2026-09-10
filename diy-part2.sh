#!/bin/bash
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 2-设置管理地址  
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate 
# 修改默认luci
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile

# 设置 luci-theme-aurora 为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile
echo "CONFIG_PACKAGE_kmod-mt7615e=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7615e-fw=y" >> .config
echo "CONFIG_PACKAGE_firmware-mt7615e=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt7663-firmware-ap=y" >> .config
echo "CONFIG_PACKAGE_kmod-mt76-core=y" >> .config
