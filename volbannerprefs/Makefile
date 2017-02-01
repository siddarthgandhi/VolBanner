include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = VolBannerPrefs
VolBannerPrefs_FILES = VBPRootListController.m
VolBannerPrefs_INSTALL_PATH = /Library/PreferenceBundles
VolBannerPrefs_FRAMEWORKS = UIKit
VolBannerPrefs_PRIVATE_FRAMEWORKS = Preferences
VolBannerPrefs__LIBRARIES = cepheiprefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/VolBannerPrefs.plist$(ECHO_END)
