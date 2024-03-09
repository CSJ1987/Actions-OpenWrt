#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.10/g' package/base-files/files/bin/config_generate

# 去除dockerd校验
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/g' feeds/packages/utils/dockerd/Makefile

# 添加netdata对ssl支持
sed -i 's/+libjson-c/+libjson-c +libopenssl/g' feeds/packages/admin/netdata/Makefile
sed -i 's/disable-https/enable-https/g' feeds/packages/admin/netdata/Makefile
sed -i 's/http/https/g' feeds/luci/applications/luci-app-netdata/luasrc/view/netdata/netdata.htm

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
