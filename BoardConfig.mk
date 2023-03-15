# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/infinix/X6815C

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Arch Suffix
TARGET_IS_64_BIT := true
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Infinix-X6815C,X6815C

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X6815C
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

# Kernel
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x40078000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Args
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040

# Dynamic Partition
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200
BOARD_MAIN_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor

# File System
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    preloader \
    product \
    system \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor
    
# Platform
PRODUCT_PLATFORM := mt6877
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM )

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_HAS_NO_SELECT_BUTTON := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
#TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TARGET_USES_MKE2FS := true # Use mke2fs to create ext4 images
TW_HAS_MTP := true
TW_INCLUDE_NTFS_3G := true

# Maintainer/Version
TW_DEVICE_VERSION := perilouspike

# Set brightness path and level
TW_MAX_BRIGHTNESS := 1000
TW_DEFAULT_BRIGHTNESS := 500
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Include some binaries
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_BASH := true

# Use Toolbox instead of Busybox
TW_USE_TOOLBOX := true

# drift/offset
TW_QCOM_ATS_OFFSET := 1617714502203

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Statusbar icon flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := 605
TW_CUSTOM_CLOCK_POS := 40
#TW_CUSTOM_BATTERY_POS := 800

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true

# Excludes
TW_EXCLUDE_TWRP_APP := true

# Property Override
#TW_OVERRIDE_SYSTEM_PROPS := \
    #"ro.build.date.utc;ro.bootimage.build.date.utc=ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"


####################################################################
# SHRP stuffs - specific lines                                     #                        
####################################################################
# NOTE - Dont use '-' or blank spaces in flag values , otherwise it will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC).


# Mandatory flags

# Path of your SHRP Tree *
SHRP_PATH := device/infinix/X8615C
# Maintainer name *
SHRP_MAINTAINER := perilouspike
# Device codename *
SHRP_DEVICE_CODE := X8615C
# Recovery Type (It can be treble,normal,SAR) [Only for About Section] *
SHRP_REC_TYPE := Treble
# Recovery Type (It can be A/B or A_only) [Only for About Section] *
SHRP_DEVICE_TYPE := A/B
# Use this flag only if your device is A/B or Virtual A/B.
SHRP_AB := true

# Important flags

# Storage paths, put your device's storage paths from fstab *
SHRP_INTERNAL := /sdcard
# External SDcard path
SHRP_EXTERNAL := /external_sd
# USB OTG path
SHRP_OTG := /usb_otg
# Put 0 to disable flashlight *
SHRP_FLASH := 1

# Optional flags

# SHRP padding flag (for rounded corner devices only). You have to change these values according to your device's roundness.
SHRP_STATUSBAR_RIGHT_PADDING := 48
SHRP_STATUSBAR_LEFT_PADDING := 48
# SHRP Express, enables on-the-fly theme patching (also persistent) + persistent lock [Optional]
SHRP_EXPRESS := true
# SHRP Express use Data save shrp files inside /data instead of /system
SHRP_EXPRESS_USE_DATA := true
# Max Brightness of LED [Optional]
SHRP_FLASH_MAX_BRIGHTNESS := 200
# Custom led paths for flashlight
SHRP_CUSTOM_FLASHLIGHT := true
#SHRP_FONP_1 := /sys/devices/virtual/torch/torch/torch_level
# Do not include the SHRP theming system
SHRP_LITE := true


# Default addons

# SHRP_SKIP_DEFAULT_ADDON_X := true
# --> will not add this addon
# INC_IN_REC_ADDON_X := true
# --> will add this addon & store it within the recovery ramdisk (i.e. NOT in the internal storage!)

# Addon - Substratum Overlay (OMS -Normal- disabler)
SHRP_SKIP_DEFAULT_ADDON_1 := true

# Addon - Substratum Overlay (OMS -legacy- disabler)
SHRP_SKIP_DEFAULT_ADDON_2 := true

# Addon - Clear Fingerprint (remove fingerprint lock from system)
SHRP_SKIP_DEFAULT_ADDON_3 := true

# Addon - Force Encryption (remove force encryption from your device)
SHRP_SKIP_DEFAULT_ADDON_4 := true

# To hide the prebuilt magisk flash option from recovery.
SHRP_EXCLUDE_MAGISK_FLASH := true
