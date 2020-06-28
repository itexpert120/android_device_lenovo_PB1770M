# Copyright (C) 2014 The CyanogenMod Project
#           (C) 2017 The LineageOS Project
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

$(call inherit-product, device/lenovo/PB1770M/full_PB1770M.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8939

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := PB1770M
PRODUCT_NAME := lineage_PB1770M
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Phab Plus
PRODUCT_MANUFACTURER := Lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

PRODUCT_BUILD_PROP_OVERRIDES += \
	   PRIVATE_BUILD_DESC="msm8916_64-user 5.1.1 LMY47V eng.build.20160923.120019 release-keys" \
           PRODUCT_NAME="PB1770M" 

BUILD_FINGERPRINT="Lenovo/PB1-770M/PB1-770M:5.1.1/S100/PB1-770M_S000409_160923_ROW:user/release-keys" \
