include $(THEOS)/makefiles/common.mk
ARCHS = arm64

TWEAK_NAME = DockColour
DockColour_FILES = Tweak.xm
DockColour_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dockcolourprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
