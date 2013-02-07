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

LOCAL_PATH := vendor/amazon/otter-common/proprietary

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bin/bbx:/system/bin/bbx \
    $(LOCAL_PATH)/bin/battery_log.sh:system/bin/battery_log.sh \
    $(LOCAL_PATH)/bin/klog.sh:system/bin/klog.sh \
    $(LOCAL_PATH)/bin/temperature_log.sh:system/bin/temperature_log.sh \
    $(LOCAL_PATH)/firmware/ducati-m3.512MB.bin:system/etc/firmware/ducati-m3.512MB.bin \
    $(LOCAL_PATH)/firmware/ducati-m3.bin:system/etc/firmware/ducati-m3.bin \
    $(LOCAL_PATH)/firmware/ti-connectivity/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
    $(LOCAL_PATH)/firmware/ti-connectivity/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
    $(LOCAL_PATH)/firmware/ti-connectivity/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
    $(LOCAL_PATH)/firmware/ti-connectivity/wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin \
    $(LOCAL_PATH)/firmware/ti-connectivity/TQS_S_2.6.ini:/system/etc/wifi/TQS_S_2.6.ini

