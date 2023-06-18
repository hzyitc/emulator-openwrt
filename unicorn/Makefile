include $(TOPDIR)/rules.mk

PKG_NAME:=unicorn
PKG_VERSION:=1.0.3
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/unicorn-engine/unicorn/tar.gz/${PKG_VERSION}?
PKG_HASH:=64fba177dec64baf3f11c046fbb70e91483e029793ec6a3e43b028ef14dc0d65

PKG_MAINTAINER:=unicorn-engine
PKG_LICENSE:=GPL-2.0 License
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

PYTHON3_PKG_SETUP_DIR:=bindings/python/
PYTHON3_PKG_SETUP_VARS+= \
  LIBUNICORN_PATH=/usr/lib

define Package/unicorn
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU.
  URL:=https://www.unicorn-engine.org/
endef

define Package/unicorn/description
  Allows you to partly emulate an Android native library.
endef

define Package/python3-unicorn
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python bindings for the unicorn library
  DEPENDS:=+unicorn +python3-light +python3-ctypes +python3-distutils +python3-pkg-resources
endef

define Package/python3-unicorn/description
  $(call Package/unicorn/description)
  This package contains Python 3 bindings for the unicorn library.
endef

define Package/unicorn/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libunicorn.so* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/unicorn/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/include/unicorn/* $(1)/usr/include/unicorn/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libunicorn.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/unicorn.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,unicorn))

$(eval $(call Py3Package,python3-unicorn))
$(eval $(call BuildPackage,python3-unicorn))
$(eval $(call BuildPackage,python3-unicorn-src))
