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

set -e

# Passwall / sing-box 依赖的新 golang feeds，保持与 sbwml 24.x 一致。
rm -rf feeds/packages/lang/golang
git clone --depth=1 -b 24.x https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

# ==================== 性能优化 + 默认主题 ====================

# 强制默认 Argon 主题。
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 清理多余主题，节省镜像空间。
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-openwrt-2020

# mentohust 依赖 libpcap，避免不同仓库版本下漏依赖。
if [ -f package/mentohust/Makefile ] && ! grep -q 'libpcap' package/mentohust/Makefile; then
    sed -i '/^  DEPENDS:=/ s/$/ +libpcap/' package/mentohust/Makefile
fi

# 默认 LAN IP 由 .config 中的 CONFIG_TARGET_PREINIT_IP 控制。
