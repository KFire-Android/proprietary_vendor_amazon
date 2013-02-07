#!/system/bin/sh

TEMPERATURE_LOG=/data/temperature_log

# Get the serial number
# FIXME: Need to add this back later - hoiho
#set -- `idme serial`
#SERIAL=$3
SERIAL=empty
BL_COOL_DEV=/sys/kernel/debug/thermal_debug/devices/backlight_cooling/inject_action
BL_COOL_ACT=/sys/kernel/debug/thermal_debug/devices/backlight_cooling/action*
CHARGER_COOL_DEV=/sys/kernel/debug/thermal_debug/devices/charger_cooling/inject_action
CHARGER_COOL_ACT=/sys/kernel/debug/thermal_debug/devices/charger_cooling/action*
CASE_GOVERNOR=/sys/kernel/debug/thermal_debug/devices/case_governor

echo "#serial[$SERIAL]" > $TEMPERATURE_LOG
echo "==================================================================" >> $TEMPERATURE_LOG
echo "*                     Thermal Policy Table                       *" >> $TEMPERATURE_LOG 
echo "==================================================================" >> $TEMPERATURE_LOG


if [ -e $BL_COOL_DEV ]; then
	echo "*BACKLIGHT COOLING ACTION" >> $TEMPERATURE_LOG
	for i in $BL_COOL_ACT; do
		action=`cat $i`
		echo "$i:$action" >> $TEMPERATURE_LOG
	done 
fi

if [ -e $CHARGER_COOL_DEV ]; then
	echo "*CHARGER COOLING ACTION" >> $TEMPERATURE_LOG
	for i in $CHARGER_COOL_ACT; do
		action=`cat $i`
		echo "$i:$action" >> $TEMPERATURE_LOG
	done 
fi

if [ -e $CASE_GOVERNOR ]; then
        tcold=`cat  $CASE_GOVERNOR/sys_threshold_cold`
        cpu_tcold=`cat $CASE_GOVERNOR/cpu_threshold_cold`
        thot=`cat $CASE_GOVERNOR/sys_threshold_hot`
	echo "\nsys_threshold_cold:$tcold" >> $TEMPERATURE_LOG
	echo "cpu_threshold_cold:$cpu_tcold" >> $TEMPERATURE_LOG
	echo "sys_threshold_hot:$thot" >> $TEMPERATURE_LOG

fi


echo "==================================================================\n" >> $TEMPERATURE_LOG

echo '#time,battery_temp,pcb_temp,emif0_t_index,emif1_t_index,cpu_temp,cpu0_freq,cpu1_freq,cpu_load,hotspot_temp,voltage_now,current_now,battery_capacity,charge_current,vcore1_cur_adc,vpanel_cur_adc,vsys_cur_adc,vbkl_cur_adc,vsys_adc,brightness' >> $TEMPERATURE_LOG

while true; do
	sleep 1

	NOW=$(date +%s)
	BATTERY_TEMP=$(cat /sys/class/power_supply/bq27541/temp)
	PCB_TEMP=$(cat /sys/devices/platform/omap/omap_i2c.3/i2c-3/3-0070/temp1_input)
	EMIF0_T_INDEX=$(cat /sys/devices/platform/omap/omap_emif.0/temperature)
	EMIF1_T_INDEX=$(cat /sys/devices/platform/omap/omap_emif.1/temperature)
	CPU_TEMP=$(cat /sys/devices/platform/omap/omap_temp_sensor.0/temp1_input)
	CPU0_FREQ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	CPU1_FREQ=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
	set -- `cat /proc/loadavg`
	CPU_LOAD=$1
	HOTSPOT_TEMP=$(cat /sys/class/thermal_sensor/thermal_sensor0/device/hotspot_temp)
	BANDGAP_VOLTAGE=$(cat /sys/class/power_supply/bq27541/voltage_now)
	BANDGAP_CURRENT=$(cat /sys/class/power_supply/bq27541/current_now)
	BATTERY_CAPACITY=$(cat /sys/class/power_supply/bq27541/capacity)
	CHARGE_CURRENT=$(cat /sys/class/power_supply/smb347_usb/device/charge_current)
	VCORE1_ADC=$(cat /sys/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl6030_gpadc/in1_raw_code)
	VPANEL_ADC=$(cat /sys/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl6030_gpadc/in4_raw_code)
	VSYSCUR_ADC=$(cat /sys/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl6030_gpadc/in5_raw_code)
	VBKL_ADC=$(cat /sys/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl6030_gpadc/in6_raw_code)
	VSYS_ADC=$(cat /sys/devices/platform/omap/omap_i2c.1/i2c-1/1-0049/twl6030_gpadc/in3_raw_code)
	BL=$(cat /sys/class/backlight/bowser/brightness)
	echo "$NOW,$BATTERY_TEMP,$PCB_TEMP,$EMIF0_T_INDEX,$EMIF1_T_INDEX,$CPU_TEMP,$CPU0_FREQ,$CPU1_FREQ,$CPU_LOAD,$HOTSPOT_TEMP,$BANDGAP_VOLTAGE,$BANDGAP_CURRENT,$BATTERY_CAPACITY,$CHARGE_CURRENT,$VCORE1_ADC, $VPANEL_ADC, $VSYSCUR_ADC, $VBKL_ADC ,$VSYS_ADC ,$BL" >> $TEMPERATURE_LOG
done
