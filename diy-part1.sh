#!/bin/bash

set -e

# 规避 Actions 中继承的凭据干扰公共仓库 clone。
git config --global credential.helper ""

add_feed() {
    local name="$1"
    local url="$2"

    sed -i "\|^src-git ${name} |d" feeds.conf.default
    echo "src-git ${name} ${url}" >> feeds.conf.default
}

clone_package() {
    local repo_url="$1"
    local dest_dir="$2"

    rm -rf "$dest_dir"
    git clone --depth=1 "$repo_url" "$dest_dir"
}

# ==================== 性能优先 + 华农校园网全套（来自 justhil 帖子） ====================

# Passwall + sing-box（可选，轻量翻墙）
add_feed passwall_packages "https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main"
add_feed passwall "https://github.com/Openwrt-Passwall/openwrt-passwall.git;main"
add_feed passwall2 "https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main"

# Argon 主题
clone_package https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
clone_package https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# mentohust + luci 前端（sbwml 版）
clone_package https://github.com/sbwml/luci-app-mentohust package/mentohust

# UA2F + luci-app-ua2f（华农校园网必备）
clone_package https://github.com/Zxilly/UA2F.git package/ua2f
clone_package https://github.com/lucikap/luci-app-ua2f.git package/luci-app-ua2f

# 其他 iptables/kmod/mwan3 直接在 .config 开启即可（feeds 自带）
