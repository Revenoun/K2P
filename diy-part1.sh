#!/bin/bash
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

set -euo pipefail

echo ">>> [diy-part1] 当前目录: $(pwd)"
cd openwrt

# 示例：添加第三方 feed（按需启用）
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 示例：删除不想用的默认 feed
# sed -i '/helloworld/d' feeds.conf.default

echo ">>> [diy-part1] 完成"
