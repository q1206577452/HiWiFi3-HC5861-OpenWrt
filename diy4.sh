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
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#固件架构
cat >> .config <<EOF
CONFIG_MODULES=y
CONFIG_HAVE_DOT_CONFIG=y
CONFIG_TARGET_bcm53xx=y
CONFIG_TARGET_bcm53xx_generic=y
CONFIG_TARGET_bcm53xx_generic_DEVICE_phicomm_k3=y
EOF

#取消默认启用的软件
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
EOF

#启用软件
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-app-jd-dailybonus=y
EOF
