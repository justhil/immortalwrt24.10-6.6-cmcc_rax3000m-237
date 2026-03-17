#!/bin/bash
#
# ==================== 性能优先 + 华农校园网全套（来自 justhil 帖子） ====================

# Passwall + sing-box（可选，轻量翻墙，性能王者）
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git" >> feeds.conf.default

# Argon 主题（颜值+性能）
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# mentohust + luci 前端（sbwml 轻量版，兼容 MT7981）
git clone --depth=1 https://github.com/sbwml/luci-app-mentohust package/mentohust

# UA2F + luci-app-ua2f（华农校园网必备，来自 justhil 帖子）
git clone --depth=1 https://github.com/Zxilly/UA2F.git package/ua2f
git clone --depth=1 https://github.com/Zxilly/luci-app-ua2f.git package/luci-app-ua2f

# 其他 iptables/kmod/mwan3 直接在 .config 开启即可（feeds 自带）
