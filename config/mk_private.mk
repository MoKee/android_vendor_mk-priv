# Use all private apps
PRODUCT_PACKAGES += \
    Lawnchair \
    LawnFeed \
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

ifneq ($(filter armani condor deb dior falcon flo i9100 mako maserati spyder targa tomato umts_spyder,$(MK_BUILD)),)
SMALL_BOARD_SYSTEMIMAGE_PARTITION := true
TARGET_BOOTANIMATION_HALF_RES := true
endif

# Default input method apps
ifeq ($(filter armeabi armeabi-v7a arm64-v8a,$(MK_CPU_ABI)),)
PRODUCT_PACKAGES += \
    LatinIME
else
PRODUCT_PACKAGES += \
    GoogleIntl
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
ifneq ($(filter h811 h815 h830 h850 jason kccat6 kiwi lentislte nx510j nx549j nx563j nx595j s2 z2pro zl1 zoom,$(MK_BUILD)),)
WITH_DEXPREOPT := false
endif

# Default sound effects app
PRODUCT_PACKAGES += \
    AudioFX
