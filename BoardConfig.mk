# Product-specific compile-time definitions

# Build bootloader and kernel from source; don't just install binaries
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
UBOOT_CONFIG := omap3_overo
KERNEL_CONFIG := overo_android

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

# Use SGX for OpenGL
OMAPES := 5.x
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/gumstix/overo/egl.cfg

# No Recovery Parition
TARGET_NO_RECOVERY := true

# These aren't strictly necessary but avoids compilation
# errors on standard Android make targets
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 4096
