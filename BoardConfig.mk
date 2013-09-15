# Overo configuration

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_PROVIDES_INIT_RC := true
TARGET_NO_RADIOIMAGE := true
USE_CAMERA_STUB := true
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
BUILD_WITHOUT_PV := true
#BUILD_WITH_FULL_STAGEFRIGHT := true

#BUILD_PV_VIDEO_ENCODERS := 1

#BOARD_USES_OMAP3_LIGHTS := true

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/libertas_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "libertas_sdio"
WIFI_DRIVER_MODULE_ARG  := ""
WIFI_TEST_INTERFACE     := "wlan0"

# Bluetooth
#BOARD_HAVE_BLUETOOTH := true

# Setup some runtime system properties.
TARGET_BOARD_PLATFORM := omap3
TARGET_BOOTLOADER_BOARD_NAME := overo
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_NEON := true
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_ARCH:= arm
TARGET_CPU_VARIANT := generic
#HARDWARE_OMX := true

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
   hardware/ti/omx/system/src/openmax_il/omx_core/inc \
   hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif
