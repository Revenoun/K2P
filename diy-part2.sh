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

#勾选 luci-theme-aurora
sed -i 's/# CONFIG_PACKAGE_luci-theme-aurora is not set/CONFIG_PACKAGE_luci-theme-aurora=y/' .config
#取消默认bootstrap主题（可选，不需要可以删掉此行）
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/# CONFIG_PACKAGE_luci-theme-bootstrap is not set/' .config



