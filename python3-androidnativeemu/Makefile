include $(TOPDIR)/rules.mk

PKG_NAME:=python3-androidnativeemu
# PKG_VERSION:=0.0.2
PKG_VERSION:=master-20211231
PKG_RELEASE:=$(AUTORELEASE)

# PYPI_NAME:=androidemu
# PKG_HASH:=d7253b4e09d372cb7d08f8da047b6d73d28d9ee52078bb72f6db638d53dd062e

git_ref:=fdcfd4ed73aadf396f9d7433056d9541c1d35033
PKG_SOURCE:=AndroidNativeEmu-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/AeonLucid/AndroidNativeEmu/tar.gz/$(git_ref)?
PKG_HASH:=b09cb6da163b3600e1cefde0359599998692c24eac5b0fc6df4a5caa017e66b1
PKG_BUILD_DIR:=$(BUILD_DIR)/AndroidNativeEmu-$(git_ref)/

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

# define CheckDependencies
#   true
# endef

define Package/python3-androidnativeemu/extra_provides
	echo libdl.so
endef

$(eval $(call Py3Package,python3-androidnativeemu))
$(eval $(call BuildPackage,python3-androidnativeemu))
$(eval $(call BuildPackage,python3-androidnativeemu-src))
