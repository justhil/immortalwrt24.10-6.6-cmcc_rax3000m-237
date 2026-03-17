#!/bin/bash
#
# ==================== 性能优先插件 + 主题 + mentohust ====================

# 1. Passwall + sing-box（科学上网性能王者，轻量 TUN/FakeIP，HNAT 完美兼容）
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git" >> feeds.conf.default

# 2. Argon 主题（颜值+性能双满分，动画极少）
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# 3. mentohust（校园网 802.1x）+ luci 前端（sbwml 版，轻量稳定）
git clone --depth=1 https://github.com/sbwml/luci-app-mentohust package/mentohust

# 其他标准插件无需 clone（feeds 自带）
# sqm / adblock / upnp / statistics 直接在 .config 开启即可
