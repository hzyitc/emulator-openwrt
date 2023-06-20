include $(TOPDIR)/rules.mk

PKG_NAME:=keystone
PKG_VERSION:=0.9.2
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/keystone-engine/keystone.git
PKG_SOURCE_VERSION:=dc7932ef2b2c4a793836caec6ecab485005139d6

PKG_MAINTAINER:=keystone-engine
PKG_LICENSE:=GPL-2.0 License
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1
CMAKE_INSTALL:=1
PYTHON3_PKG_FORCE_DISTUTILS_SETUP:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

CMAKE_OPTIONS+= \
	-DBUILD_LIBS_ONLY=ON \
	-DBUILD_SHARED_LIBS=ON

PYTHON3_PKG_SETUP_DIR:=bindings/python/

define Package/keystone
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Keystone assembler framework
  URL:=http://www.keystone-engine.org/
  DEPENDS:=+libstdcpp
endef

define Package/keystone/description
  Keystone is a lightweight multi-platform, multi-architecture assembler framework.
endef

define Package/python3-keystone
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python bindings for the keystone library
  DEPENDS:=+keystone +python3-light +python3-ctypes +python3-distutils
endef

define Package/python3-keystone/description
  $(call Package/keystone/description)
  This package contains Python 3 bindings for the keystone library.
endef

define Build/Compile
	$(call Build/Compile/Default)
	$(call Py3Build/Compile)
endef

define Build/Install
	$(call Build/Install/Default)
	$(call Py3Build/Compile)
endef

define Package/keystone/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libkeystone.so* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/keystone/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	# $(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/keystone/* $(1)/usr/include/keystone/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libkeystone.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/keystone.pc $(1)/usr/lib/pkgconfig/
	# $(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kstool $(1)/usr/bin/
endef

$(eval $(call BuildPackage,keystone))

$(eval $(call Py3Package,python3-keystone))
$(eval $(call BuildPackage,python3-keystone))
$(eval $(call BuildPackage,python3-keystone-src))
