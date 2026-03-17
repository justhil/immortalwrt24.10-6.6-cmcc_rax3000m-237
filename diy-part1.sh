#!/bin/bash
#

# ==================== 修复 GitHub Actions git clone credential 错误 ====================
git config --global credential.helper ""

# ==================== 你的原有内容（性能优先 + 华农全套） ====================
# Passwall + sing-box（可选）
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git" >> feeds.conf.default

# Argon 主题
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# mentohust
git clone --depth=1 https://github.com/sbwml/luci-app-mentohust package/mentohust

# UA2F（华农必备）
git clone --depth=1 https://github.com/Zxilly/UA2F.git package/ua2f
git clone --depth=1 https://github.com/Zxilly/luci-app-ua2f.git package/luci-app-ua2f
