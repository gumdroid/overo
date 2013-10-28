# Root Android Makefile + some board specific targets
# Modified from https://gitorious.org/rowboat/build/core/root.mk

# Note: This is abusing the Android build system a little biti by
# adding the kernel, uboot, and SGX as recursive make targets. Really,
# http://android.git.linaro.org/gitweb?p=device/linaro/common.git
# is a better way to do things and keeps all build output in the
# $(PRODUCT_OUT) directory.  Unfortunately, this doesn't play nicely
# with the SGX build....


## Pull in the normal Android build system
include build/core/main.mk

# Setup toolchains
# U-Boot needs bare GCC 4.7+; use the full Android toolchain elsewhere
BARE_TC_PREFIX := arm-eabi-
BARE_TC_PATH := $(realpath $(TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/)
ANDROID_TC_PREFIX := $(shell basename $(TARGET_TOOLS_PREFIX))
ANDROID_TC_PATH := $(realpath $(shell dirname $(TARGET_TOOLS_PREFIX)))
export PATH :=$(PATH):$(ANDROID_TC_PATH):$(BARE_TC_PATH)

# Define our extra build targets
bsp: sgx_build kernel_build uboot_build uinitrd

bsp_clean: sgx_clean kernel_clean uboot_clean

# U-Boot
uboot_build:
	$(MAKE) -C uboot CROSS_COMPILE=$(BARE_TC_PREFIX) $(UBOOT_CONFIG)
	mkdir -p $(PRODUCT_OUT)/boot
	$(ACP) uboot/MLO $(PRODUCT_OUT)/boot/
	$(ACP) uboot/u-boot.img $(PRODUCT_OUT)/boot/

uboot_clean:
	$(MAKE) -C uboot CROSS_COMPILE=$(BARE_TC_PREFIX) distclean

# Linux
kernel_not_configured := $(wildcard kernel/.config)

kernel_build:
ifeq ($(strip $(kernel_not_configured)),)
	$(MAKE) -C kernel ARCH=arm $(KERNEL_CONFIG)
endif
	$(MAKE) -C kernel ARCH=arm CROSS_COMPILE=$(ANDROID_TC_PREFIX) uImage
	mkdir -p $(PRODUCT_OUT)/boot
	$(ACP) kernel/arch/arm/boot/uImage $(PRODUCT_OUT)/boot/

kernel_clean:
	$(MAKE) -C kernel ARCH=arm  distclean

# SGX
# Note: the 'Rules.make' file for this build is hard-coded to use the bare metal toolchain...
sgx_build: kernel_build
	$(MAKE) -C hardware/ti/sgx ANDROID_ROOT_DIR=$(realpath $(TOP)) OMAPES=$(OMAPES)
	$(MAKE) -C hardware/ti/sgx ANDROID_ROOT_DIR=$(realpath $(TOP)) OMAPES=$(OMAPES) install

sgx_clean:
	$(MAKE) -C hardware/ti/sgx ANDROID_ROOT_DIR=$(realpath $(TOP)) clean

# uInitrd
# need uboot-mkimage installed...should really just get it from u-boot directory
uinitrd: ramdisk
	mkdir -p $(PRODUCT_OUT)/boot
	mkimage -A arm -O linux -T ramdisk -C gzip -d $(PRODUCT_OUT)/ramdisk.img $(PRODUCT_OUT)/boot/uInitrd


# Sample media files
media: 
	mkdir -p $(PRODUCT_OUT)/data/media
	$(ACP) device/gumstix/pepper/media/* $(PRODUCT_OUT)/data/media/
	#tar cvjf mediatarball.tar.bz $(PRODUCT_OUT)/userdata -C $(PRODUCT_OUT)/userdata/
