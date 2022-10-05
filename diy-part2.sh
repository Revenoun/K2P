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

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认wifi名称ssid为tymishop
#sed -i 's/ssid=OpenWrt/ssid=tymishop/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh



# # Install theme
# rm -rf package/lean/luci-theme-argon 
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/lean/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git  package/lean/luci-theme-argon-config
git clone https://github.com/garypang13/luci-app-eqos package/lean/package/eqos
