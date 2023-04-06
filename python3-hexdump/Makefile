include $(TOPDIR)/rules.mk

PKG_NAME:=python3-hexdump
PKG_VERSION:=3.3
PKG_RELEASE:=$(AUTORELEASE)

PYPI_NAME:=hexdump
PYPI_SOURCE_EXT:=zip
PKG_HASH:=d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db
UNPACK_CMD=unzip -q -d $(1) $(DL_DIR)/$(PKG_SOURCE)

PKG_MAINTAINER:=techtonik
PKG_LICENSE:=Public Domain
PKG_LICENSE_FILES:=LICENSE

PYTHON3_PKG_SETUP_ARGS:=

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-hexdump
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Dump binary data to hex format and restore from there
  URL:=https://bitbucket.org/techtonik/hexdump/
  DEPENDS:=+python3-light
endef

define Package/python3-hexdump/description
  Dump binary data to hex format and restore from there.
endef

define Build/Compile
	$(call Py3Build/Compile)
endef

$(eval $(call Py3Package,python3-hexdump))
$(eval $(call BuildPackage,python3-hexdump))
$(eval $(call BuildPackage,python3-hexdump-src))
