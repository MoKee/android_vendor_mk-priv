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
    Lawnchair \
    Lawnfeed \
    MoKeePay \
    Phonograph \
    ViaBrowser

# Use all private binaries
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/mk-priv/prebuilt/mokee/bin/$(MK_CPU_ABI),system/bin)

# Use all private libraries
ifeq ($(MK_CPU_ABI),arm64-v8a)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk-priv/prebuilt/mokee/lib/$(MK_CPU_ABI),system/lib64) \
    $(call find-copy-subdir-files,*.so,vendor/mk-priv/prebuilt/mokee/lib/armeabi-v7a,system/lib)
else
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.so,vendor/mk-priv/prebuilt/mokee/lib/$(MK_CPU_ABI),system/lib)
endif

# Offline phone location database
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,mokee-phonelocation.dat,vendor/mk-priv/prebuilt/mokee/media/location,system/media/location)

# Optimize for low-end devices
ifneq ($(filter armani condor deb dior falcon find7 flo gucci i9100 mako tomato wt88047,$(MK_BUILD)),)
SMALL_BOARD_SYSTEMIMAGE_PARTITION := true
TARGET_BOOTANIMATION_HALF_RES := true
USE_REDUCED_CJK_FONT_WEIGHTS := true
endif

# Disable dex-preopt of some devices to save space.
ifeq ($(SMALL_BOARD_SYSTEMIMAGE_PARTITION),true)
# Include MK audio files
include vendor/mk/config/mk_audio_mini.mk
WITH_DEXPREOPT := false
PRODUCT_DEFAULT_INPUT_METHOD := Pinyin
else
# Include MK audio files
include vendor/mk/config/mk_audio.mk
PRODUCT_PACKAGES += \
    vim
ifeq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_DEFAULT_INPUT_METHOD := LatinIME
else
PRODUCT_DEFAULT_INPUT_METHOD := Gboard
endif
endif

# Disable dex-preopt of some devices to fix compile.
ifneq ($(filter h811 h815 h830 h850,$(MK_BUILD)),)
WITH_DEXPREOPT := false
endif

# Default input method apps
PRODUCT_PACKAGES += \
    $(PRODUCT_DEFAULT_INPUT_METHOD)

# Use MoKee build keys
ifneq (${PRODUCT_MOKEE_DEV_CERTIFICATE},)
PRODUCT_DEFAULT_DEV_CERTIFICATE := ${PRODUCT_MOKEE_DEV_CERTIFICATE}/releasekey
else
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/mk-priv/build/target/product/security/releasekey
endif