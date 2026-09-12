#!/bin/bash

# 修改默认 IP 地址（把 192.168.1.1 改成你想要的，比如 192.168.5.1）
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
