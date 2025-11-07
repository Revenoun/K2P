#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Add a feed source
# sed -i '2 c\src-git luci https://github.com/coolsnowwolf/luci' feeds.conf.default
# sed -i '3 c\#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05' feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld;main' >>feeds.conf.default


