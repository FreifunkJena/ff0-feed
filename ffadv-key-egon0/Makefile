#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# Package content copyright (C) 
#      2012 Freifunk Rheinland e. V. <http://www.freifunk-rheinland.net/>


include $(TOPDIR)/rules.mk

PKG_NAME:=ffadv-key-egon0
PKG_VERSION:=20160331
PKG_RELEASE:=3

include $(INCLUDE_DIR)/package.mk

define Package/ffadv-key-egon0
  SECTION:=base
  CATEGORY:=Utilities
  SUBMENU:=Freifunk Advanced
  PKGARCH:=all
  DEFAULT:=n
  TITLE:=SSH maintenance key (FFJ egon0)
  MAINTAINER:=egon0 (Freifunk Jena) <egon0@freifunk-jena.de>
  URL:=http://www.freifunk-jena.de
  DEPENDS:=+dropbear
endef

define Package/ffadv-key-egon0/description
  SSH key for maintenance
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ffadv-key-egon0/postinst
#!/bin/sh
# post-install script.

if [ ! -f "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys" ]; then
  echo "+ file 'authorized_keys' not found, creating file"
  mkdir -p "$${IPKG_INSTROOT}/etc/dropbear"
  touch "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
fi

echo "+ adding egon0's SSH key"

sed \
  -e "/egon0 (Freifunk Jena) <egon0@freifunk-jena.de>/d" \
  -i "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD10olAF5NuYoDoRf2uL7zIOlFE2d46+l0vFrL/BE9PwU6Sum4RXe0h45qYia3Yw2+uj1IhjGGmJnsx1keh3uGCivvYVS9tPeHAuzyx1VlPsnPyUJcBqUGKSDiciUiDBVht0JAeNJxNsqsFb31xfXtp/gasNb1utNBdjCjc41LztqQjL6qu3IEscDa85hZyM+jJGBHDAJ6bFuifxSsxwLHBxRlpPXyqqbMo9VvmOm8qNIYIWea0Qva2OS7djsesh4r9r4bdUryyL4p8Pr/4M1S6ByacxQ4sb/aoGEJmFMZz7y1R+aNsJ1K58fApsFuJftVXGT9yb2coblpe7XQqokmN # egon0 (Freifunk Jena) <egon0@freifunk-jena.de>" \
  >> "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmtCmochVLtVGQYc+NBVwQUPSfzth6chAAV6/LiMJ5aT80Mnrihhz49FDoXGzkGgMeJud8c09llZTpFsxpS37ExzqiNclojM3ImrtTF43k0l9tatMUXFtCBsRh4fKpJjbnWlvnv6CjdLkcaTITr4Y+ecBGKSKGoLK6qiVYssfuWmy4I3/o9nwrIAqah3bUR4yjwcoo7e7qyKzck9EjDon1H/SOJsp2UuAGqC0JX6Nwr0tTriZ9ef70F4xHMBglebq1vhsKg2+8PVeMrbYGAv45GjmRwywGEZ4n18ehep+b//++4ZwDGVtcUOzMPhVNsvK23kdNNEKYYm+Tsl8ykaRkXYBB3s38fGuoTofaZXVf5s+6a8DWeTmahqWaskHR4mBNmESu2js4bWvgH+MO9Yi+vYRz/jwgfNl30Q0C9hGtpgIu/6DglHb3Ss948vl5GGi5/iFkpDJmCiheOzs+i3xzxB2yb9cQxNFuJAgI2SNUQ63068J54IILl+WC2VZrIURR7VVaGspq3JYGDEsLSd5uOHFAx36n/CrlQBsbcy2yQYZ8ZE06rahaxAhlvz3LT1M9gUF6hy5MV3lzDkVnMER2nnS6dJZ1ViktwvuwqSSpOXmCBlXVSktSVSlT32Ym295FGyJpqUFrNd/rTwb1SX7arK0YSANRo+Q4k3O1qEEtaw== # egon0-mobi (Freifunk Jena) <egon0@freifunk-jena.de>" \
  >> "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGHPPfF+sox3K6nDt7f8aWH9Q1ao/oEi+4zTBHUE4noAgXDCjqcW3EvM5HwsK9PaEJNgfcvndFL1Qv+YcfFusxBtSFow8p6WeUGVmh6XQCsRQtOD4GPGL5XauaSKzb+Ot3APtE6uayeGbTdx6cRPokRMzNzuoyVomLUkAxg1yArjGU/EfUkzLpgPY5T+/xgPPH+OsEasYdhduVki/8539nc0F2msBzYJNqjZHUSLX3SEK4SgjLX2GRysFRGo1/sFoqJTasIEWE2GxAZrAtQx1DmWsPGD0X0O1Qpf45Q/QE9P3R2xvMCpS9bU0hL5JaH3XozAtr+GakOVLdr9JbVfcr XperiaZ1c # egon0-mobi2 (Freifunk Jena) <egon0@freifunk-jena.de>" \
  >> "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
endef

define Package/ffadv-key-egon0/postrm
#!/bin/sh
# post-removal script.

echo "+ removing egon0's SSH key"

sed \
  -e "/egon0 (Freifunk Jena) <egon0@freifunk-jena.de>/d" \
  -i "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
sed \
  -e "/egon0-mobi (Freifunk Jena) <egon0@freifunk-jena.de>/d" \
  -i "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
sed \
  -e "/egon0-mobi2 (Freifunk Jena) <egon0@freifunk-jena.de>/d" \
  -i "$${IPKG_INSTROOT}/etc/dropbear/authorized_keys"
exit 0
endef

define Package/ffadv-key-egon0/install
	mkdir -p $(1)/CONTROL
	$(INSTALL_BIN) ./ipkg/ffadv-key-egon0.postinst $(1)/CONTROL/postinst
	$(INSTALL_BIN) ./ipkg/ffadv-key-egon0.postrm $(1)/CONTROL/postrm
endef

$(eval $(call BuildPackage,ffadv-key-egon0))
