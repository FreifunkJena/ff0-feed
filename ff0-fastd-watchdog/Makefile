#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# Package content copyright (C) 
# 2014	Linus Broich <lcb01@lcb01.de>
# 2016  Micha Stöcker <micha@freifunk-jena.de>

include $(TOPDIR)/rules.mk

PKG_NAME:=ff0-fastd-watchdog
PKG_VERSION:=20160411
PKG_RELEASE:=1
PKG_REV:=dd4f340dc6c2b34ad0c76c131d5250bf4fb6d689

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.gz
PKG_MD5SUM:=always-use-git
PKG_SOURCE_URL:=git://github.com/FreifunkAdvanced/fastd-watchdog.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=git

include $(INCLUDE_DIR)/package.mk

define Package/ff0-fastd-watchdog
  SECTION:=base
  CATEGORY:=Utilities
  SUBMENU:=Freifunk Zero
  PKGARCH:=all
  DEFAULT:=n
  TITLE:=fastd watchdog
  MAINTAINER:=Micha Stöcker <micha@freifunk-jena.de>
  DEPENDS:=+fastd
endef

define Package/ff0-fastd-watchdog/description
	fastd watchdog
endef

define Build/Compile
endef

define Package/ff0-fastd-watchdog/postinst
#!/bin/sh
# post-install script.

if [ ! -f "${IPKG_INSTROOT}/etc/crontabs/root" ]; then
  echo "+ crontab 'root' not found, creating file"
  mkdir -p "${IPKG_INSTROOT}/etc/crontabs"
  touch "${IPKG_INSTROOT}/etc/crontabs/root"
fi

echo "+ adding fastd watchdog crontab entry"

sed \
  -e "/fastd watchdog/d" \
  -i "${IPKG_INSTROOT}/etc/crontabs/root"

echo "*/3 * * * * /usr/sbin/fastd_watchdog # fastd watchdog" \
  >> "${IPKG_INSTROOT}/etc/crontabs/root"
exit 0
endef

define Package/ff0-fastd-watchdog/postrm
#!/bin/sh
# post-removal script.

echo "+ removing crontab entries"

sed \
  -e "/fastd watchdog/d" \
  -i "${IPKG_INSTROOT}/etc/crontabs/root"
exit 0
endef

define Package/ff0-fastd-watchdog/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/sbin/fastd_watchdog   $(1)/usr/sbin
endef

$(eval $(call BuildPackage,ff0-fastd-watchdog))
