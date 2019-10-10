#
# Copyright (C) 2019 The MoKee Open Source Project
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
#

# Use all private apps
PRODUCT_PACKAGES += \
    Aegis \
    Longshot \
    MoKeePay \
    Phonograph \
    ViaBrowser

# Use all private libraries
ifeq ($(MK_CPU_ABI),arm64-v8a)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mokee-priv/prebuilt/mokee/lib/$(MK_CPU_ABI),system/lib64) \
    $(call find-copy-subdir-files,*.so,vendor/mokee-priv/prebuilt/mokee/lib/armeabi-v7a,system/lib)
else ifeq ($(MK_CPU_ABI),x86_64)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mokee-priv/prebuilt/mokee/lib/$(MK_CPU_ABI),system/lib64) \
    $(call find-copy-subdir-files,*.so,vendor/mokee-priv/prebuilt/mokee/lib/x86,system/lib)
else
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mokee-priv/prebuilt/mokee/lib/$(MK_CPU_ABI),system/lib)
endif

# Offline phone location database
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,mokee-phonelocation.dat,vendor/mokee-priv/prebuilt/mokee/media/location,system/media/location)

# Optimize for low-end devices
ifneq ($(filter aries armani dior find7 gucci m8d m8 wt88047,$(MK_BUILD)),)
# Include MK audio files
include vendor/mokee/config/mokee_audio_mini.mk
TARGET_BOOTANIMATION_HALF_RES := true
USE_REDUCED_CJK_FONT_WEIGHTS := true
# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_DEFAULT_INPUT_METHOD := Pinyin
else
# Include MK audio files
include vendor/mokee/config/mokee_audio.mk
PRODUCT_PACKAGES += \
    vim
ifeq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_DEFAULT_INPUT_METHOD := LatinIME
else
PRODUCT_DEFAULT_INPUT_METHOD := Gboard
endif
endif

# Default input method apps
PRODUCT_PACKAGES += \
    $(PRODUCT_DEFAULT_INPUT_METHOD)

# Use MoKee build keys
ifneq (${PRODUCT_DEFAULT_MOKEE_CERTIFICATE},)
PRODUCT_DEFAULT_DEV_CERTIFICATE := ${PRODUCT_DEFAULT_MOKEE_CERTIFICATE}/releasekey
else
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/mokee-priv/build/target/product/security/releasekey
endif

# Use MoKee Java Source Overlays
ifneq ($(filter PREMIUM,$(MK_BUILDTYPE)),)
JAVA_SOURCE_OVERLAYS := framework|vendor/mokee-priv/overlay/premium/frameworks/base|**/*.java
endif
