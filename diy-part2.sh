#!/bin/bash
# diy-part2.sh - 在更新 feeds 之后执行的自定义脚本

# 添加第三方插件 (例如：添加 OpenClash 源码)
# git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 添加自定义软件包 (例如：替换默认的 hello world 插件版本)
# rm -rf package/lean/luci-app-helloworld
# git clone --depth=1 https://github.com/fw876/helloworld.git package/luci-app-helloworld

# 删除不需要的默认插件以减小固件体积 (示例：删除 luci-app-xxx)
# rm -rf package/lean/luci-app-xxx
