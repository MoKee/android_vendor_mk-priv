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

ifneq ($(filter armani condor deb dior falcon find7 flo gucci i9100 mako tomato wt88047,$(MK_BUILD)),)
SMALL_BOARD_SYSTEMIMAGE_PARTITION := true
TARGET_BOOTANIMATION_HALF_RES := true
USE_REDUCED_CJK_FONT_WEIGHTS := true
endif

# Default input method apps
ifeq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_PACKAGES += \
    LatinIME
else
PRODUCT_PACKAGES += \
    Gboard
endif

# Disable dex-preopt of some devices to save space.
ifeq ($(SMALL_BOARD_SYSTEMIMAGE_PARTITION),true)
# Include MK audio files
include vendor/mk/config/mk_audio_mini.mk
WITH_DEXPREOPT := false
else
# Include MK audio files
include vendor/mk/config/mk_audio.mk
PRODUCT_PACKAGES += \
    vim
endif

# Disable dex-preopt of some devices to fix compile.
ifneq ($(filter h811 h815 h830 h850,$(MK_BUILD)),)
WITH_DEXPREOPT := false
endif

# Use MoKee build keys
ifneq ($(filter HISTORY NIGHTLY RELEASE,$(MK_BUILDTYPE)),)
ifneq (${DEFAULT_MOKEE_CERTIFICATE},)
PRODUCT_DEFAULT_DEV_CERTIFICATE := ${DEFAULT_MOKEE_CERTIFICATE}/releasekey
endif
endif