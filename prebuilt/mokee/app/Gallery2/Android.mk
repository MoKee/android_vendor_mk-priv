#
# Copyright (C) 2018-2019 The MoKee Open Source Project
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

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := Gallery2
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_TAGS := optional

LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk

LOCAL_PREBUILT_JNI_LIBS_arm := \
    @lib/armeabi-v7a/libNativeImageProcessor.so \
    @lib/armeabi-v7a/libpano_video_renderer.so \
    @lib/armeabi-v7a/libpanorenderer.so \
    @lib/armeabi-v7a/libpl_droidsonroids_gif.so

LOCAL_PREBUILT_JNI_LIBS_arm64 := \
    @lib/arm64-v8a/libNativeImageProcessor.so \
    @lib/arm64-v8a/libpano_video_renderer.so \
    @lib/arm64-v8a/libpanorenderer.so \
    @lib/arm64-v8a/libpl_droidsonroids_gif.so

LOCAL_PREBUILT_JNI_LIBS_x86 := \
    @lib/x86/libNativeImageProcessor.so \
    @lib/x86/libpano_video_renderer.so \
    @lib/x86/libpanorenderer.so \
    @lib/x86/libpl_droidsonroids_gif.so

LOCAL_PREBUILT_JNI_LIBS_x86_64 := \
    @lib/x86_64/libNativeImageProcessor.so \
    @lib/x86_64/libpano_video_renderer.so \
    @lib/x86_64/libpanorenderer.so \
    @lib/x86_64/libpl_droidsonroids_gif.so

LOCAL_CERTIFICATE := releasekey

include $(BUILD_PREBUILT)
