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
    @lib/armeabi-v7a/libpanorenderer.so \
    @lib/armeabi-v7a/libpano_video_renderer.so \
    @lib/armeabi-v7a/libpl_droidsonroids_gif.so \
    @lib/armeabi-v7a/librsjni_androidx.so \
    @lib/armeabi-v7a/librsjni.so \
    @lib/armeabi-v7a/librs.jpeg_v6_5_0.so \
    @lib/armeabi-v7a/librs.render_3d_lut_v6_5_0.so \
    @lib/armeabi-v7a/librs.render_adjust_v6_5_1.so \
    @lib/armeabi-v7a/librs.render_blur_v6_5_0.so \
    @lib/armeabi-v7a/librs.render_clarity_v6_5_0.so \
    @lib/armeabi-v7a/librs.render_duotone_v6_5_0.so \
    @lib/armeabi-v7a/librs.render_sharpness_v6_5_1.so \
    @lib/armeabi-v7a/librs.split_v6_5_0.so \
    @lib/armeabi-v7a/libRSSupport.so

LOCAL_PREBUILT_JNI_LIBS_arm64 := \
    @lib/arm64-v8a/libpanorenderer.so \
    @lib/arm64-v8a/libpano_video_renderer.so \
    @lib/arm64-v8a/libpl_droidsonroids_gif.so \
    @lib/arm64-v8a/librsjni_androidx.so \
    @lib/arm64-v8a/librsjni.so \
    @lib/arm64-v8a/librs.jpeg_v6_5_0.so \
    @lib/arm64-v8a/librs.render_3d_lut_v6_5_0.so \
    @lib/arm64-v8a/librs.render_adjust_v6_5_1.so \
    @lib/arm64-v8a/librs.render_blur_v6_5_0.so \
    @lib/arm64-v8a/librs.render_clarity_v6_5_0.so \
    @lib/arm64-v8a/librs.render_duotone_v6_5_0.so \
    @lib/arm64-v8a/librs.render_sharpness_v6_5_1.so \
    @lib/arm64-v8a/librs.split_v6_5_0.so \
    @lib/arm64-v8a/libRSSupport.so

LOCAL_PREBUILT_JNI_LIBS_x86 := \
    @lib/x86/libpanorenderer.so \
    @lib/x86/libpano_video_renderer.so \
    @lib/x86/libpl_droidsonroids_gif.so \
    @lib/x86/librsjni_androidx.so \
    @lib/x86/librsjni.so \
    @lib/x86/librs.jpeg_v6_5_0.so \
    @lib/x86/librs.render_3d_lut_v6_5_0.so \
    @lib/x86/librs.render_adjust_v6_5_1.so \
    @lib/x86/librs.render_blur_v6_5_0.so \
    @lib/x86/librs.render_clarity_v6_5_0.so \
    @lib/x86/librs.render_duotone_v6_5_0.so \
    @lib/x86/librs.render_sharpness_v6_5_1.so \
    @lib/x86/librs.split_v6_5_0.so \
    @lib/x86/libRSSupport.so

LOCAL_PREBUILT_JNI_LIBS_x86_64 := \
    @lib/x86_64/libpl_droidsonroids_gif.so \
    @lib/x86_64/librsjni_androidx.so \
    @lib/x86_64/librsjni.so \
    @lib/x86_64/librs.jpeg_v6_5_0.so \
    @lib/x86_64/librs.render_3d_lut_v6_5_0.so \
    @lib/x86_64/librs.render_adjust_v6_5_1.so \
    @lib/x86_64/librs.render_blur_v6_5_0.so \
    @lib/x86_64/librs.render_clarity_v6_5_0.so \
    @lib/x86_64/librs.render_duotone_v6_5_0.so \
    @lib/x86_64/librs.render_sharpness_v6_5_1.so \
    @lib/x86_64/librs.split_v6_5_0.so \
    @lib/x86_64/libRSSupport.so

LOCAL_CERTIFICATE := releasekey

include $(BUILD_PREBUILT)
