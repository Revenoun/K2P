#!/bin/bash

# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Add a feed source
# 添加 Aurora 主题源
#sed -i '$a src-git aurora https://github.com/eamonxg/luci-theme-aurora' feeds.conf.default

#rm -rf package/luci-theme-aurora
#git clone https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora

# sed -i '2 c\src-git luci https://github.com/coolsnowwolf/luci' feeds.conf.default
# sed -i '3 c\#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05' feeds.conf.default
#echo 'src-git helloworld https://github.com/fw876/helloworld.git' >>feeds.conf.default

echo "==================== DIY-PART1 START ===================="
cd lede
# 直接克隆Aurora主题到package目录，稳定性优于feeds源
rm -rf package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora
# 第三方插件源，不需要保持注释
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
echo "==================== DIY-PART1 END ======================"



