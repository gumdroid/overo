ifeq (overo,$(TARGET_DEVICE))
LOCAL_PATH := $(call my-dir)

# if some modules are built directly from this directory (not subdirectories),
# their rules should be written here.

include $(call all-makefiles-under,$(LOCAL_PATH))
endif

#LOCAL_PATH := $(call my-dir)
#
#ifeq ($(TARGET_PROVIDES_INIT_RC),true)
#file := $(TARGET_ROOT_OUT)/init.rc
#$(file): $(LOCAL_PATH)/init.rc | $(ACP)
#	$(transform-prebuilt-to-target)
#ALL_PREBUILT += $(file)
#endif
#
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/init.rc:root/init.rc
#
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab
#
## WPA
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
#
## Firmware
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/firmware/sd8686.bin:system/etc/firmware/sd8686.bin
#
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/firmware/sd8686_helper.bin:system/etc/firmware/sd8686_helper.bin
#
## Modules
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/libertas/libertas_sdio.ko:system/lib/modules/libertas_sdio.ko
#
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf
#
## initlogo
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/initlogo.rle.keep:root/initlogo.rle.keep
#
## touchscreen -- replace with your own version of pointercal
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/pointercal:system/etc/pointercal
#
# Get the default set of alert sounds
# include frameworks/base/data/sounds/OriginalAudio.mk
