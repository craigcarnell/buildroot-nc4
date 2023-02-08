################################################################################
#
# pmloglib
#
################################################################################

PMLOGLIB_VERSION = 5a26755c09cd9d0355ec2907ded4078d00bd38c1
PMLOGLIB_SITE = $(call github,webosose,pmloglib,$(PMLOGLIB_VERSION))
PMLOGLIB_INSTALL_STAGING = YES
PMLOGLIB_SUPPORTS_IN_SOURCE_BUILD = NO

PMLOGLIB_DEPENDENCIES = \
	host-pkgconf \
	cmake-modules-webos \
	libglib2 \
	libpbnjson

define PMLOGLIB_LINK_CMAKE_MODULES
	ln -snf $(STAGING_DIR)/usr/local/webos/Modules/webOS $(@D)/webOS
endef

PMLOGLIB_PRE_CONFIGURE_HOOKS += PMLOGLIB_LINK_CMAKE_MODULES

PMLOGLIB_CONF_OPTS += \
	-DCMAKE_POLICY_DEFAULT_CMP0053=OLD \
	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/local/webos/Modules \
	-DWEBOS_INSTALL_ROOT=/

$(eval $(cmake-package))
