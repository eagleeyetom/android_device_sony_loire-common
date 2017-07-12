#
# This is for TWRP Recovery
#

COMMON_PATH := device/sony/loire-common
TWRP_OUT := recovery/root

TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 255
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/twrp.fstab:$(TWRP_OUT)/etc/twrp.fstab \
    $(COMMON_PATH)/rootdir/sbin/pulldecryptfiles.sh:$(TWRP_OUT)/sbin/pulldecryptfiles.sh

PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:$(TWRP_OUT)/system/usr/share/zoneinfo/tzdata
    
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true

RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXTRA_LANGUAGES := true
TW_NEW_ION_HEAP := true
TW_DEFAULT_BRIGHTNESS := 230
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone4/temp
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_SUPERSU := true
TWHAVE_SELINUX := true
TARGET_HW_DISK_ENCRYPTION := true
TARGET_RECOVERY_DEVICE_MODULES := libbinder libgui libui libEGL libGLESv2 libprotobuf-cpp-lite libsync                       
TW_RECOVERY_ADDITIONAL_RELINK_FILES := $(OUT)/system/lib64/libbinder.so $(OUT)/system/lib64/libgui.so $(OUT)/system/lib64/libui.so $(OUT)/system/lib64/libEGL.so $(OUT)/system/lib64/libGLESv2.so $(OUT)/system/lib64/libprotobuf-cpp-lite.so $(OUT)/system/lib64/libsync.so

