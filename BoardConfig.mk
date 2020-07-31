#
# Copyright (C) 2016 The CyanogenMod Project
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

# Inherit from msm8916-common
include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/lenovo/PB1770M

# Assertions
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true
TARGET_FLATTEN_APEX := true

# Audio
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Offline charging
RED_LED_PATH := "/sys/class/leds/chg_red/brightness"
BLUE_LED_PATH := "/sys/class/leds/chg_blue/brightness"
BLUE_LED_PATH := "/sys/class/leds/chg_green/brightness"
CHARGING_ENABLED_PATH := "/sys/class/power_supply/usb/online"
HEALTHD_BACKLIGHT_LEVEL := 60

# Crypto
TARGET_HW_DISK_ENCRYPTION := false
TARGET_LEGACY_HW_DISK_ENCRYPTION := false

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_USES_GRALLOC1 := true
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true
USE_OPENGL_RENDERER = true

# Filesystem
TARGET_USERIMAGES_USE_F2FS          := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 0x02000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 27913075712
BOARD_CACHEIMAGE_PARTITION_SIZE     := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE              := 131072 # BOARD_KERNEL_PAGESIZE * 64

# GPS
TARGET_NO_RPC := true

# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_SOURCE := kernel/lenovo/PB1770M
TARGET_KERNEL_CONFIG := lineageos_pb1770m_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Low Memory Devices
MALLOC_SVELTE := true

# LineageHW
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/lineagehw
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib64/libril.so|libshim_ril.so \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_gui.so \
    /system/vendor/lib/libmmcamera2_stats_modules.so|libshim_atomic.so \
    /system/lib/hw/camera.vendor.msm8916.so|libshim_atomic.so \
    /system/lib/libmmjpeg_interface.so|libshim_atomic.so \
    /system/vendor/lib64/libril-qc-qmi-1.so|rild_socket.so \
    /system/vendor/lib/libmmcamera2_imglib_modules.so|libshim_atomic.so

# WLAN
TARGET_PROVIDES_WCNSS_QMI := true

# inherit from the proprietary version
-include vendor/lenovo/PB1770M/BoardConfigVendor.mk

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Enable dexpreopt to speed boot time
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
WITH_DEXPREOPT_DEBUG_INFO := false
USE_DEX2OAT_DEBUG := false
DONT_DEXPREOPT_PREBUILTS := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep \
    Settings \
    SystemUI
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2016-02-01

# Power
TARGET_HAS_LEGACY_POWER_STATS := true
TARGET_HAS_NO_WLAN_STATS := true
TARGET_USES_INTERACTION_BOOST := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
