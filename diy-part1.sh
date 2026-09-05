#!/bin/bash
#=====================diy1.sh 开始=====================
# 克隆 aurora 主题到package
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora

# 创建uci-defaults首次开机自动设置aurora为默认主题
mkdir -p package/luci-theme-aurora/files
cat > package/luci-theme-aurora/files/99-set-aurora-default <<'EOF'
#!/bin/sh
uci set luci.main.theme='aurora'
uci set luci.core.mediaurlbase='/luci-static/aurora'
uci commit luci
exit 0
EOF

# 将uci脚本写入Makefile，打包进固件
echo -e "\ndefine Package/luci-theme-aurora/install\n\t\$(call Package/luci/theme/install,\$(1))\n\t\$(CP) ./files/99-set-aurora-default \$(1)/etc/uci-defaults/\nendef" >> package/luci-theme-aurora/Makefile

# 更新feeds（Lean源码必须）
./scripts/feeds update -a
./scripts/feeds install -a

# 补丁修改luci默认配置（全新刷机默认aurora）
patch -p1 <<'EOF'
--- a/feeds/luci/modules/luci-base/root/etc/config/luci
+++ b/feeds/luci/modules/luci-base/root/etc/config/luci
@@ -1,6 +1,6 @@
 config core
-	option mediaurlbase '/luci-static/bootstrap'
+	option mediaurlbase '/luci-static/aurora'

 config main
 	option lang auto
-	option theme bootstrap
+	option theme aurora
EOF
#=====================diy1.sh结束=====================
