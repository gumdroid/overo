# This is the build configuration for Gumstix Overo Computer-On-Modules.
# It is based on the 'Toro' device conifguration file (Copyright Google Inc.)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
$(call inherit-product, device/gumstix/common/common.mk)
$(call inherit-product, device/gumstix/overo/device.mk)

PRODUCT_NAME := overo
PRODUCT_DEVICE := overo
PRODUCT_BRAND := Android
PRODUCT_MODEL := Overo
PRODUCT_MANUFACTURER := Gumstix_Inc 
