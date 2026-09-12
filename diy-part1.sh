#!/bin/bash
# diy-part1.sh - 在更新 feeds 之前执行的自定义脚本

# 修改默认 IP 地址为 192.168.1.1 (根据自己需求修改)
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
#sed -i 's/OpenWrt/MyRouter/g' package/base-files/files/bin/config_generate

# 修改默认主题 (这里假设使用 argon 主题，需确保源码中已包含)
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
