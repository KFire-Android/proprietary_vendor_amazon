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

LOCAL_PATH := vendor/amazon/bowser-common/proprietary

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bin/battery_log.sh:/system/bin/battery_log.sh \
    $(LOCAL_PATH)/bin/cond_start_ril:/system/bin/cond_start_ril \
    $(LOCAL_PATH)/bin/emmc_init.sh:/system/bin/emmc_init.sh \
    $(LOCAL_PATH)/bin/temperature_log.sh:/system/bin/temperature_log.sh \
    $(LOCAL_PATH)/bin/thermal_setup.sh:/system/bin/thermal_setup.sh \
    $(LOCAL_PATH)/firmware/firmware-$(TARGET_BOOTLOADER_BOARD_SUBTYPE).bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/firmware/firmware-$(TARGET_BOOTLOADER_BOARD_SUBTYPE).bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/firmware/firmware-$(TARGET_BOOTLOADER_BOARD_SUBTYPE).bin:system/vendor/firmware/fw_bcmdhd_p2p.bin \
    $(LOCAL_PATH)/firmware/nvram_tate_usi.txt:system/etc/wifi/nvram_tate_usi.txt \
    $(LOCAL_PATH)/firmware/nvram_tate_semco.txt:system/etc/wifi/nvram_tate_semco.txt \
    $(LOCAL_PATH)/firmware/nvram_jem_semco.txt:system/etc/wifi/nvram_jem_semco.txt \
    $(LOCAL_PATH)/firmware/nvram_jem_usi.txt:system/etc/wifi/nvram_jem_usi.txt \
    $(LOCAL_PATH)/firmware/nvram_jem-wan_semco.txt:system/etc/wifi/nvram_jem-wan_semco.txt \
    $(LOCAL_PATH)/firmware/nvram_jem-wan_usi.txt:system/etc/wifi/nvram_jem-wan_usi.txt \
    $(LOCAL_PATH)/firmware/nvram.txt:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/lib/libsmartvolume.so:system/lib/libsmartvolume.so \
    $(LOCAL_PATH)/vendor/data/ds1-default.xml:system/vendor/data/ds1-default.xml \
    $(LOCAL_PATH)/vendor/smartvolume/anlg_dock_headset.csv:system/vendor/smartvolume/anlg_dock_headset.csv \
    $(LOCAL_PATH)/vendor/smartvolume/aux_digital.csv:system/vendor/smartvolume/aux_digital.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_a2dp.csv:system/vendor/smartvolume/bt_a2dp.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_a2dp_headphones.csv:system/vendor/smartvolume/bt_a2dp_headphones.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_a2dp_speaker.csv:system/vendor/smartvolume/bt_a2dp_speaker.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_sco_carkit.csv:system/vendor/smartvolume/bt_sco_carkit.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_sco.csv:system/vendor/smartvolume/bt_sco.csv \
    $(LOCAL_PATH)/vendor/smartvolume/bt_sco_headset.csv:system/vendor/smartvolume/bt_sco_headset.csv \
    $(LOCAL_PATH)/vendor/smartvolume/default.csv:system/vendor/smartvolume/default.csv \
    $(LOCAL_PATH)/vendor/smartvolume/dgtl_dock_headeset.csv:system/vendor/smartvolume/dgtl_dock_headeset.csv \
    $(LOCAL_PATH)/vendor/smartvolume/earpiece.csv:system/vendor/smartvolume/earpiece.csv \
    $(LOCAL_PATH)/vendor/smartvolume/fm_radio_tx.csv:system/vendor/smartvolume/fm_radio_tx.csv \
    $(LOCAL_PATH)/vendor/smartvolume/speaker.csv:system/vendor/smartvolume/speaker.csv \
    $(LOCAL_PATH)/vendor/smartvolume/wired_headphone.csv:system/vendor/smartvolume/wired_headphone.csv \
    $(LOCAL_PATH)/vendor/smartvolume/wired_headset.csv:system/vendor/smartvolume/wired_headset.csv

