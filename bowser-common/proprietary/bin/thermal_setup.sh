#!/system/bin/sh 
BL_COOL_DEV=/sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
CHARGER_COOL_DEV=/sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
sleep 3
echo "Setting up thermal policy" > /dev/kmsg
if [ -e $BL_COOL_DEV ]; then
	echo "Setting up thermal threshold for backlight_cooling device" > /dev/kmsg
	echo 0 100 > /sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
	echo 1 90 > /sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
	echo 3 80 > /sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
	echo 4 70 > /sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
fi

if [ -e $CHARGER_COOL_DEV ]; then
	echo "Setting up thermal threshold for charger_cooling device" > /dev/kmsg
	echo 0 1800 > /sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
	echo 1 1500 > /sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
	echo 2 1200 > /sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
	echo 7 0 > /sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
fi




