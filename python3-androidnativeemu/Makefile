include $(TOPDIR)/rules.mk

PKG_NAME:=python3-androidnativeemu
# PKG_VERSION:=0.0.2
PKG_RELEASE:=$(AUTORELEASE)

# PYPI_NAME:=androidemu
# PKG_HASH:=d7253b4e09d372cb7d08f8da047b6d73d28d9ee52078bb72f6db638d53dd062e

PKG_SOURCE_PROTO:=git
PKG_SOURCE:=AndroidNativeEmu-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/AeonLucid/AndroidNativeEmu.git
PKG_SOURCE_DATE:=2022-03-14
PKG_SOURCE_VERSION:=10da9bb9b6f7a12641f87ab09c08fdc045bacbc7

PKG_MAINTAINER:=AeonLucid
PKG_LICENSE:=GPL-3.0 License
PKG_LICENSE_FILES:=LICENSE

# include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-androidnativeemu
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Allows you to partly emulate an Android native library.
  URL:=https://github.com/AeonLucid/AndroidNativeEmu
  DEPENDS:=+python3-light +python3-unicorn +python3-pyelftools +python3-hexdump +python3-keystone
endef

define Package/python3-androidnativeemu/description
  Allows you to partly emulate an Android native library.
endef

# AndroidNativeEmu contains some Android libraries
# So we need to skip denpendency check for libraries
define CheckDependencies
  true
endef

$(eval $(call Py3Package,python3-androidnativeemu))
$(eval $(call BuildPackage,python3-androidnativeemu))
$(eval $(call BuildPackage,python3-androidnativeemu-src))
