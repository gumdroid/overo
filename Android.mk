# Makefile for the Gumstix Overo Device directory
# This makes any locally defined make targets available to the Android
# build system.  Make sure these only get build for the appropriate
# $(TARGET_PRODUCT)
LOCAL_PATH := $(call my-dir)
include $(call all-makefiles-under,$(LOCAL_PATH))
