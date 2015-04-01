#!/system/bin/sh

if [ -f /sys/class/mmc_host/mmc0/mmc0:0001/manfid ]; then
    MANFID=`cat /sys/class/mmc_host/mmc0/mmc0:0001/manfid`
else
    MANFID=`cat /sys/class/mmc_host/mmc1/mmc1:0001/manfid`
fi

if [ -f /sys/class/mmc_host/mmc0/mmc0:0001/serial ]; then
    SERIAL=`cat /sys/class/mmc_host/mmc0/mmc0:0001/serial`
else
    SERIAL=`cat /sys/class/mmc_host/mmc1/mmc1:0001/serial`
fi

echo "0x${MANFID:6:2}${SERIAL:2:8}"
log -p i -t metrics.emmcid "system:def:emmc_manfid_$MANFID=1;CT;1:NR"
log -p i -t metrics.emmcid "system:def:emmc_serial_$SERIAL=1;CT;1:NR"
