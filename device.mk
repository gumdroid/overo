# Define components to include in an Androild build for this product.
# Based on device.mk from TI's beaglebone and panda

KERNEL_CONFIG := $(LOCAL_PATH)/overo_android_defconfig

# Pull in specific local files
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/init.overo.rc:root/init.overo.rc \
	$(LOCAL_PATH)/init.overo.usb.rc:root/init.overo.usb.rc \
	$(LOCAL_PATH)/fstab.overo:root/fstab.overo \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle \
	$(LOCAL_PATH)/sd8686.bin:system/etc/firmware/sd8686.bin \
	$(LOCAL_PATH)/sd8686_helper.bin:system/etc/firmware/sd8686_helper.bin \
	$(LOCAL_PATH)/sd8787_uapsta.bin:system/etc/firmware/mrvl/sd8787_uapsta.bin \
	$(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/ti-tsc.idc:system/usr/idc/ti-tsc.idc \
        $(LOCAL_PATH)/uEnv.txt:boot/uEnv.txt \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

# Don't make SGX work too hard
# PRODUCT_PROPERTY_OVERRIDES := hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
# Our screen is 4.3" 480x272: roughly 120 display-independent-pixels
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=120

# System specific libraries
PRODUCT_PACKAGES += \
	lights.overo

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
