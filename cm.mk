# -- Enable 64-bit apps ------------------------------------------------------------------
$(call inherit-product,$(SRC_TARGET_DIR)/product/core_64_bit.mk)
# -- Inherit from the common Open Source product configuration ---------------------------
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# -- Include all languages ---------------------------------------------------------------
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# -- The gps config appropriate for this device ------------------------------------------
$(call inherit-product, device/common/gps/gps_us_supl.mk)
# -- Include verity_key to ramdisk, use signing boot.img ---------------------------------
$(call inherit-product, $(SRC_TARGET_DIR)/product/verity.mk)
# ----------------------------------------------------------------------------------------
LOCAL_PATH := device/sony/hollyss
# ----------------------------------------------------------------------------------------
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
# --Default packages ---------------------------------------------------------------------
PRODUCT_PACKAGES += \
	charger_res_images \
	com.android.future.usb.accessory \
	Torch \
	Stk \
# -- GLES software gpu driver ------------------------------------------------------------
PRODUCT_PACKAGES += libGLES_android
# -- Ramdisk -----------------------------------------------------------------------------
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.mt6795:root/fstab.mt6795 \
	$(LOCAL_PATH)/fstab.charger:root/fstab.charger \
	$(LOCAL_PATH)/root/enableswap.sh:root/enableswap.sh \
	$(LOCAL_PATH)/root/factory_init.project.rc:root/factory_init.project.rc \
	$(LOCAL_PATH)/root/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/root/init.aee.rc:root/init.aee.rc \
	$(LOCAL_PATH)/root/init.common_svc.rc:root/init.common_svc.rc \
	$(LOCAL_PATH)/root/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/root/init.mt6595.rc:root/init.mt6595.rc \
	$(LOCAL_PATH)/root/init.mt6795.rc:root/init.mt6795.rc \
	$(LOCAL_PATH)/root/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(LOCAL_PATH)/root/init.performance.rc:root/init.performance.rc \
	$(LOCAL_PATH)/root/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/root/init.recovery.mt6795.rc:root/init.recovery.mt6795.rc \
	$(LOCAL_PATH)/root/init.ssd.rc:root/init.ssd.rc \
	$(LOCAL_PATH)/root/init.trustonic.rc:root/init.trustonic.rc \
	$(LOCAL_PATH)/root/meta_init.modem.rc:root/meta_init.modem.rc \
	$(LOCAL_PATH)/root/meta_init.project.rc:root/meta_init.project.rc \
	$(LOCAL_PATH)/root/meta_init.rc:root/meta_init.rc \
	$(LOCAL_PATH)/root/ueventd.mt6595.rc:root/ueventd.mt6595.rc \
	$(LOCAL_PATH)/root/ueventd.mt6795.rc:root/ueventd.mt6795.rc
# -- These are the hardware-specific features -----------------------------------------
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml
# -- Keyboard layouts --------------------------------------------------------------------
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(LOCAL_PATH)/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
	$(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	$(LOCAL_PATH)/configs/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl
# -- dalvik.gc.type ---------------------------------------------------------------------
PRODUCT_TAGS += dalvik.gc.type-precise
 # -- Device uses high-density artwork where available -----------------------------------
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
# -- Bootanimation -----------------------------------------------------------------------
TARGET_BOOTANIMATION_NAME := 1080
# ----------------------------------------------------------------------------------------
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=5
# -- Dalvik/HWUI - set correct memory limits ---------------------------------------------
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)
# -- Inherit some common CM stuff --------------------------------------------------------
$(call inherit-product,vendor/cm/config/common_full_phone.mk)
# -- Specific vendor blobs ---------------------------------------------------------------
#$(call inherit-product, vendor/sony/hollyss/hollyss-vendor-blobs.mk)
# -- Device identifier. This must come after all inclusions ------------------------------
PRODUCT_RELEASE_NAME := Xperia_M5
PRODUCT_DEVICE := hollyss
PRODUCT_NAME := cm_hollyss
PRODUCT_BRAND := Sony
PRODUCT_MODEL := M5
PRODUCT_MANUFACTURER := Xperia
PRODUCT_RESTRICT_VENDOR_FILES := false
# ----------------------------------------------------------------------------------------

