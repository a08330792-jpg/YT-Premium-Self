TARGET := iphone:clang:latest:14.5
ARCHS := arm64 arm64e


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTPremiumSelf

YTPremiumSelf_FILES = Tweak.x
YTPremiumSelf_CFLAGS = -fno-objc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
