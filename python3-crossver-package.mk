include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

PYTHON3_CROSSPKG_DIR=/usr/lib/python3/site-packages

define Py3CrossVerPackage
  define Package/$(1)/install
	$$(call Py3Package/$(1)/install,$$(1))
	$$(call Py3Package/ProcessFilespec,$(1),$(PKG_INSTALL_DIR),$$(1))
	$(FIND) $$(1) -name '*.exe' -delete
	$$(call Python3/CompileAll,$$(1))
	# $$(call Python3/DeleteSourceFiles,$$(1))
	$$(call Python3/DeleteEmptyDirs,$$(1))
	if [ -d "$$(1)/usr/bin" ]; then \
		$$(call Python3/FixShebang,$$(1)/usr/bin/*) ; \
	fi

	mv "$$(1)/usr/lib/python$(PYTHON3_VERSION)" "$$(1)/usr/lib/python3"
  endef

  define Package/$(1)/preinst
#!/bin/sh

python3_version="$$$$(readlink "/usr/bin/python3" | sed 's!/usr/bin/!!' | sed 's/^python//')"

mkdir -p "/usr/lib/"
ln -sf "/usr/lib/python$$$$python3_version" "/usr/lib/python3"
  endef

$(eval $(call Py3Package,$(1)))
endef
