#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 删除访客网络LuCI界面
rm -rf package/feeds/luci/applications/luci-app-guest-wifi

# 删除无线隔离相关包
rm -rf package/network/services/hostapd/patches/guest-network.patch
rm -rf package/network/services/dnsmasq/files/guest.conf

# 删除防火墙隔离规则
rm -rf package/network/firewall/files/firewall.guest
# 2-设置管理地址  
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate 
# 修改默认luci
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile

