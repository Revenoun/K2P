#!/bin/bash
set -e
cd openwrt

PATCH_DIR="package/lean/mt/drivers/mt7615d/patches"
mkdir -p "$PATCH_DIR"

cat > "$PATCH_DIR/200-fix-unaligned-header.patch" <<'EOF'
--- a/mt_wifi/include/os/rt_linux.h
+++ b/mt_wifi/include/os/rt_linux.h
@@ -71,7 +71,7 @@
 #include <linux/version.h>
 #include <linux/module.h>
-#include <linux/unaligned.h>    /* for get_unaligned() */
+#include <asm/unaligned.h>      /* for get_unaligned() */
 #include <linux/kernel.h>
EOF

echo "[diy-part2] 补丁已写入 $PATCH_DIR"
