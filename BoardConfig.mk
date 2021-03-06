# Product-specific compile-time definitions

# Build bootloader and kernel from source
UBOOT_CONFIG := omap3_overo
TARGET_BOOTLOADER_IS_2ND := true
BOARD_KERNEL_BASE := 0x80000000

# As of Android 4.3, no special optimizations for Cortex-A8
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM := omap3
TARGET_BOOTLOADER_BOARD_NAME := overo
ARCH_ARM_HAVE_NEON := true

# Use SGX for OpenGL
OMAPES := 5.x
#USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/gumstix/overo/egl.cfg

# No Recovery Parition
TARGET_NO_RECOVERY := true

# These aren't strictly necessary but avoids compilation
# errors on standard Android make targets
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912	# 512MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912 # 512MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 67108864	# 64MB
BOARD_FLASH_BLOCK_SIZE := 2048	# 2KB NAND page size
