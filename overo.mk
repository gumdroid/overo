PRODUCT_PACKAGES := \
	ApiDemos      \
        SoundRecorder \
        GeneralRunner \
        EvilSkull \
        Vase \
        lights.$(TARGET_PRODUCT) \
        alsa.$(TARGET_PRODUCT) \

$(call inherit-product, build/target/product/generic.mk)

# Overrides
PRODUCT_BRAND := Gumstix
PRODUCT_NAME := overo
PRODUCT_DEVICE := overo
PRODUCT_PACKAGE_OVERLAYS := device/rowboat/generic


# Install the features available on this device.
#PRODUCT_COPY_FILES += \
#    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
#    device/gumstix/overo/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml
#LOCAL_PATH := $(call my-dir)
LOCAL_PATH := device/gumstix/overo

#ifeq ($(TARGET_PROVIDES_INIT_RC),true)
#file := $(TARGET_ROOT_OUT)/init.rc
#$(file): $(LOCAL_PATH)/init.rc | $(ACP)
#	$(transform-prebuilt-to-target)
#ALL_PREBUILT += $(file)
#endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# WPA
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Firmware
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/firmware/sd8686.bin:system/etc/firmware/sd8686.bin

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/firmware/sd8686_helper.bin:system/etc/firmware/sd8686_helper.bin

# Modules
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/libertas/libertas_sdio.ko:system/lib/modules/libertas_sdio.ko

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# initlogo
#PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/initlogo.rle.keep:root/initlogo.rle.keep

# touchscreen -- replace with your own version of pointercal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/pointercal:system/etc/pointercal

# Get the default set of alert sounds
# include frameworks/base/data/sounds/OriginalAudio.mk
