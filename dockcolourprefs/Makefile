include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = DockColourPrefs
DockColourPrefs_FILES = XXXRootListController.m
DockColourPrefs_INSTALL_PATH = /Library/PreferenceBundles
DockColourPrefs_FRAMEWORKS = UIKit
DockColourPrefs_PRIVATE_FRAMEWORKS = Preferences
DockColourPrefs_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DockColourPrefs.plist$(ECHO_END)
