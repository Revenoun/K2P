#!/bin/bash
# diy-part1.sh - 在更新 feeds 之前执行的自定义脚本

# 修改默认 IP 地址为 192.168.1.1 (根据自己需求修改)
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 修改默认主题 (这里假设使用 argon 主题，需确保源码中已包含)
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# ================= 修改默认 WiFi 名称 =================
# 定义您想要的默认 WiFi 名称 (2.4G 和 5G)
WIFI_SSID_2G="OpenWrt-2.4G"
WIFI_SSID_5G="OpenWrt-5G"

echo "开始修改默认 WiFi 名称..."

# 标记是否成功修改
MODIFIED=0

# ---------- 方法 1：修改 mac80211.sh（Lean 源码最核心的位置）----------
MAC80211_FILE="package/kernel/mac80211/files/lib/wifi/mac80211.sh"
if [ -f "$MAC80211_FILE" ]; then
    echo "找到 mac80211.sh，开始替换默认 SSID..."
    # 常见几种默认写法：OpenWrt / LEDE / OpenWrt_2.4G / OpenWrt_5G
    sed -i "s/ssid=\"OpenWrt\"/ssid=\"$WIFI_SSID_2G\"/g" "$MAC80211_FILE"
    sed -i "s/ssid='OpenWrt'/ssid='$WIFI_SSID_2G'/g" "$MAC80211_FILE"
    sed -i "s/ssid=\"LEDE\"/ssid=\"$WIFI_SSID_2G\"/g" "$MAC80211_FILE"
    sed -i "s/ssid='LEDE'/ssid='$WIFI_SSID_2G'/g" "$MAC80211_FILE"
    sed -i "s/ssid=\"OpenWrt_2.4G\"/ssid=\"$WIFI_SSID_2G\"/g" "$MAC80211_FILE"
    sed -i "s/ssid=\"OpenWrt_5G\"/ssid=\"$WIFI_SSID_5G\"/g" "$MAC80211_FILE"
    MODIFIED=1
fi

# ---------- 方法 2：修改 zzz-default-settings（老版本兜底）----------
ZZZ_FILE="package/lean/default-settings/files/zzz-default-settings"
if [ -f "$ZZZ_FILE" ]; then
    echo "找到 zzz-default-settings，开始替换..."
    sed -i "s/ssid='OpenWrt'/ssid='$WIFI_SSID_2G'/g" "$ZZZ_FILE"
    sed -i "s/ssid=\"OpenWrt\"/ssid=\"$WIFI_SSID_2G\"/g" "$ZZZ_FILE"
    MODIFIED=1
fi

# ---------- 兜底：全仓库搜索（慎用，慢但稳）----------
if [ "$MODIFIED" -eq 0 ]; then
    echo "未找到已知默认 SSID 文件，使用全仓库搜索替换..."
    grep -rl "ssid=['\"]OpenWrt['\"]" package/ 2>/dev/null | while read file; do
        echo "  修改: $file"
        sed -i "s/ssid=['\"]OpenWrt['\"]/ssid='$WIFI_SSID_2G'/g" "$file"
        MODIFIED=1
    done
fi

# ---------- 结果校验 ----------
if [ "$MODIFIED" -eq 1 ]; then
    echo "✅ 默认 WiFi 名称修改完成：2.4G=$WIFI_SSID_2G  5G=$WIFI_SSID_5G"
else
    echo "⚠️ 警告：未能匹配到任何默认 SSID 配置，请手动检查源码！"
fi
# ====================================================
