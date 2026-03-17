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
sudo apt install libfuse-dev
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
# ==================== 性能优化 + 默认主题 ====================

# 强制默认 Argon 主题（性能最高）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 清理多余主题（节省空间，性能优先）
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-openwrt-2020

# mentohust 额外优化（可选，强制编译）
sed -i 's/DEPENDS.*/DEPENDS+= +libpcap/' package/mentohust/Makefile
# ==================== 修改默认 LAN IP 为 192.168.2.1（网关） ====================
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/etc/config/network
