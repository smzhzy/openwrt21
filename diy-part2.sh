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
# 修改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
rm -fr feeds/packages/net/smartdns
rm -fr feeds/luci/applications/luci-app-smartdns
svn checkout https://github.com/openwrt/luci/trunk/applications/luci-app-smartdns feeds/luci/applications/luci-app-smartdns
svn checkout https://github.com/openwrt/packages/trunk/net/smartdns feeds/packages/net/smartdns
svn checkout https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall feeds/luci/applications/luci-app-passwall
pushd feeds/packages/lang
rm -rf golang && svn co https://github.com/openwrt/packages/branches/openwrt-22.03/lang/golang
popd
exit 0
