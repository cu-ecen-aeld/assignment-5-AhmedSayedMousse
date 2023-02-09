
##############################################################
#
# AESD-LINUX_MODULES
#
##############################################################


# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-AhmedSayedMousse.git'
LDD_VERSION = '9786fe938c1d0ed629b57f13a1c00ff780d01ee8'
LDD_LICENSE = GPL-2.0
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = scull misc-modules

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load 			 $(TARGET_DIR)/usr/bin/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload 			 $(TARGET_DIR)/usr/bin/scull_unload
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load 		 $(TARGET_DIR)/usr/bin/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload 		 $(TARGET_DIR)/usr/bin/module_unload
	
endef
$(eval $(kernel-module))
$(eval $(generic-package))
