#!/system/bin/sh

MFIDPATH=/sys/devices/platform/omap/omap_hsmmc.1/mmc_host/mmc0/mmc0:0001/manfid
MFID=`cat $MFIDPATH`
if [ "$MFID" == "0x000015" ]; then
    mount -o remount,discard /data
    mount -o remount,discard /cache
    mount -o remount,discard /efs
fi
