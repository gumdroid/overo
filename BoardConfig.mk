# Product-specific compile-time definitions

# Build bootloader and kernel from source; don't just install binaries
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
UBOOT_DIR := $(TOP)/uboot
UBOOT_CONFIG := omap3_overo
KERNEL_DIR := $(TOP)/kernel
KERNEL_CONFIG := overo_android_defconfig

# As of Android 4.3, no special optimizations for Cortex-A8
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM := omap3
TARGET_BOOTLOADER_BOARD_NAME := overo
ARCH_ARM_HAVE_NEON := true

TARGET_PROVIDES_INIT_RC := true

# No Recovery Parition
TARGET_NO_RECOVERY := true

# No cell modem
TARGET_NO_RADIOIMAGE := true

# Not sute about these settings
TARGET_USERIMAGES_USE_EXT4 := true
