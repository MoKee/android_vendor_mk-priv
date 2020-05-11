#
# Copyright (C) 2016-2019 The MoKee Open Source Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := MoKeePay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_TAGS := optional

LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_REPLACE_PREBUILT_APK_INSTALLED := $(LOCAL_PATH)/$(LOCAL_MODULE).apk

LOCAL_PRIVILEGED_MODULE := true

LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false

LOCAL_REQUIRED_MODULES := \
    default_permissions_com.mokee.pay.xml \
    privapp_whitelist_com.mokee.pay.xml

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := default_permissions_com.mokee.pay.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/default-permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp_whitelist_com.mokee.pay.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)