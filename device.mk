# Define components to include in an Androild build for this product.
# Based on device.mk from TI's beaglebone and panda

# Pull in specific local files
PRODUCT_COPY_FILES := \
	$(LOCAL_PATH)/init.overo.rc:root/init.overo.rc \
	$(LOCAL_PATH)/init.overo.usb.rc:root/init.overo.usb.rc \
	$(LOCAL_PATH)/fstab.overo:root/fstab.overo \
	$(LOCAL_PATH)/initlogo.rle:root/initlogo.rle \

# Add this to boot folder
INTERNAL_BOOTIMAGE_FILES := $(LOCAL_PATH)/uEnv.txt

# Don't make SGX work too hard
PRODUCT_PROPERTY_OVERRIDES := \
       hwui.render_dirty_regions=false

# Explicitly specify dpi, otherwise the icons don't show up correctly with SGX enabled
# Our screen is 4.3" 480x272: roughly 120 display-independent-pixels
PRODUCT_PROPERTY_OVERRIDES += \
       ro.sf.lcd_density=120

# Don't add visual fault overlays to our eng build
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

# System Utilities
PRODUCT_PACKAGES += \
	fs_get_stats \
	dhcpcd.conf \
	make_ext4fs

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

# not sure if we need these...
PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
