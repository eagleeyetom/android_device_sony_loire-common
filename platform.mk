# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/loire-common
SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# Common stuff
$(call inherit-product, device/sony/common/common_omni.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# Platform name
SOMC_PLATFORM    := loire
PRODUCT_PLATFORM := $(SOMC_PLATFORM)

# QCOM Hardware
BOARD_USES_QCOM_HARDWARE    := true
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8952
TARGET_QCOM_MEDIA_VARIANT   := caf-msm8952
TARGET_QCOM_AUDIO_VARIANT   := caf-msm8952

# Fixup SELinux file labels
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# GPU
BOARD_USES_ADRENO := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510

# CNE
BOARD_USES_QCNE := true

# Camera
USE_CAMERA_STUB := true

# Cryptfs
TARGET_HW_DISK_ENCRYPTION := true

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm8952

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(SONY_ROOT)/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# Broadcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# GTS
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/gts_config_list.txt:system/etc/gts_config_list.txt

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/rqbalance_config.xml:system/etc/rqbalance_config.xml

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# Audio
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/etc/usb_audio_policy_configuration.xml

# Media HAL
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/media_codecs_8956.xml:system/etc/media_codecs_8956.xml \
    $(SONY_ROOT)/system/etc/media_codecs_8956_v1.xml:system/etc/media_codecs_8956_v1.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance_8956.xml:system/etc/media_codecs_performance_8956.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance_8956_v1.xml:system/etc/media_codecs_performance_8956_v1.xml \
    $(SONY_ROOT)/system/etc/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(SONY_ROOT)/system/etc/media_profiles_8956.xml:system/etc/media_profiles_8956.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# Platform Init
PRODUCT_PACKAGES += \
    fstab.loire \
    init.loire.pwr \
    init.qcom.early_boot \
    init.qcom.qseecomd

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8952 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libaudioroute \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libtinycompress \
    tinymix

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8952 \
    gralloc.msm8952 \
    hwcomposer.msm8952 \
    memtrack.msm8952

# GPS
PRODUCT_PACKAGES += \
    gps.msm8952 \
    libgnsspps \
    libcurl

PRODUCT_PACKAGES += \
    flp.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    xtwifi.conf

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8952

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    brcm-uim-sysfs \
    libfmjni

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# lib shim
PRODUCT_PACKAGES += \
    libshim_wvm \
    libshim_imsvt

# Snapdragon Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera

# Sensor multihal
PRODUCT_PACKAGES += \
    sensors.msm8952

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext \
    rcscommon \
    rcscommon.xml

# Set default properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.sys.umsdirtyratio=5 \
    drm.service.enabled=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw=1300-4911 \
    ro.semc.version.sw_variant=GLOBAL-LTE2A \
    ro.semc.version.sw_revision=34.2.A.2.69 \
    ro.semc.version.fs_revision=34.2.A.2.69

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.sw_type=user
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.semc.version.cust=OmniROM \
    ro.semc.version.cust_revision=$(PLATFORM_VERSION)_$(BUILD_ID)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# TWRP
$(call inherit-product, device/sony/loire-common/twrp.mk)
