# -- inherit from the proprietary version -----------------------------------------------
LOCAL_PATH=device/sony/hollyss
-include vendor/sony/hollyss/BoardConfigVendor.mk
# -- Camera Stub ------------------------------------------------------------------------
USE_CAMERA_STUB := true
# -- Use specific headers ---------------------------------------------------------------
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
# -- Fix java_home env ------------------------------------------------------------------
JAVA_HOME :=
# -- CPU --------------------------------------------------------------------------------
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true
# ---------------------------------------------------------------------------------------
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
# ---------------------------------------------------------------------------------------
TARGET_CPU_CORTEX_A53 := true
TARGET_CPU_MEMCPY_OPT_DISABLE := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOARD_PLATFORM := mt6795
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_BOARD_PLATFORM)
# -- MediaTek hardware ------------------------------------------------------------------
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
TARGET_PROVIDES_LIBLIGHT := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += \
	-DMTK_HARDWARE \
	-DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL \
	-DDISABLE_ASHMEM_TRACKING \
	-DNO_SECURE_DISCARD \
	-DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CPPGLAGS += \
	-DMTK_HARDWARE
TARGET_GLOBAL_CFLAGS += \
	-mfpu=neon \
	-mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += \
	-mfpu=neon \
	-mfloat-abi=softfp
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_MTK_AUDIO := true
# -- Enable minikin text layout engine (will be the default soon) -----------------------
USE_MINIKIN := true
# -- Charger ----------------------------------------------------------------------------
BOARD_CHARGER_SHOW_PERCENTAGE := true
# -- Font footprint ---------------------------------------------------------------------
EXTENDED_FONT_FOOTPRINT := true
# -- Kernel -----------------------------------------------------------------------------
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=disabled
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x03f88000
BOARD_SECOND_OFFSET := 0x00e88000
BOARD_KERNEL_TAGS_OFFSET := 0x0df88000
BOARD_MKBOOTIMG_ARGS := \
	--base $(BOARD_KERNEL_BASE) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--second_offset $(BOARD_SECOND_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
# -- Building kernel from source --------------------------------------------------------
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_SOURCE := kernel/sony/holly
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_CONFIG := hollyss_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
MTK_APPENDED_DTB_SUPPORT := true
TARGET_KMODULES := true
endif
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/$(BOARD_KERNEL_IMAGE_NAME)
# -- Recovery ---------------------------------------------------------------------------
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT :=
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
# -- Recovery from boot patch -----------------------------------------------------------
BUILD_RECOVERY_FROM_BOOT_PATCH := false
# -- Use prebuilt default.prop-----------------------------------------------------------
TARGET_DEFAULT_PROP := $(LOCAL_PATH)/default.prop
# -- Merge system.prop with default.prop ------------------------------------------------
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
# -- OTA --------------------------------------------------------------------------------
TARGET_OTA_ASSERT_DEVICE := mt6795,hollyss,e5603
BLOCK_BASED_OTA := false
# -- Partitions -------------------------------------------------------------------------
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200 # fastboot getvar all
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4 # fastboot getvar all
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040 # fastboot getvar all
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040 # fastboot getvar all
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2841116672 # fastboot getvar all
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12012486656 # fastboot getvar all
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
