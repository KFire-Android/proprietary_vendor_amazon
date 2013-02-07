# Copyright (C) 2013 The Android Open Source Project
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

LOCAL_PATH := vendor/amazon/jem/proprietary

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/smc_pa.ift:/system/vendor/firmware/smc_pa.ift \
    $(LOCAL_PATH)/firmware/ducati-m3.bin:/system/vendor/firmware/ducati-m3.bin \
    $(LOCAL_PATH)/lib/sensors.omap4.so:system/lib/hw/sensors.omap4.so \
    $(LOCAL_PATH)/lib/hw/audio.primary.bowser.so:system/lib/hw/audio.primary.bowser.so \
    $(LOCAL_PATH)/lib/libril-lab126qmi.so:/system/lib/libril-lab126qmi.so

