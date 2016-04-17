#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# Package content copyright (C) 
# 2016 Micha Stöcker <micha@freifunk-jena.de>


include $(TOPDIR)/rules.mk

PKG_NAME:=ff0-alfred
PKG_VERSION:=20160417
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/ff0-alfred
  SECTION:=base
  CATEGORY:=Utilities
  SUBMENU:=Freifunk Zero
  PKGARCH:=all
  DEFAULT:=y
  TITLE:=Alfred factors
  MAINTAINER:=Micha Stöcker <micha@freifunk-jena.de>
  DEPENDS:=+alfred +ethtool +iwinfo
endef

define Package/ff0-alfred/description
	alfred factors
endef

define Build/Compile
endef

define Package/ff0-alfred/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,ff0-alfred))

