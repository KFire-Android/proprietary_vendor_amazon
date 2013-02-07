#!/system/bin/sh

BATTERY_LOG=/data/battery_log

# Get the serial number
# FIXME: Need to add this back later - hoiho
#set -- `idme serial`
#SERIAL=$3
SERIAL=empty

echo "#serial[$SERIAL]" > $BATTERY_LOG
echo '#time,temp,voltage,current,capacity,charge,charge_design,charge_full,charge_full_design,energy_avg' >> $BATTERY_LOG

while true; do
	NOW=$(date +%s)
	BATTERY_TEMP=$(cat /sys/class/power_supply/bq27541/temp)
	BATTERY_VOLTAGE=$(cat /sys/class/power_supply/bq27541/voltage_now)
	BATTERY_CURRENT=$(cat /sys/class/power_supply/bq27541/current_now)
	BATTERY_CAPACITY=$(cat /sys/class/power_supply/bq27541/capacity)
	BATTERY_CHARGE=$(cat /sys/class/power_supply/bq27541/charge_now)
	BATTERY_CHARGE_DESIGN=$(cat /sys/class/power_supply/bq27541/charge_now_design)
	BATTERY_CHARGE_FULL=$(cat /sys/class/power_supply/bq27541/charge_full)
	BATTERY_CHARGE_FULL_DESIGN=$(cat /sys/class/power_supply/bq27541/charge_full_design)
	BATTERY_ENERGY_AVG=$(cat /sys/class/power_supply/bq27541/energy_avg)

	echo "$NOW,$BATTERY_TEMP,$BATTERY_VOLTAGE,$BATTERY_CURRENT,$BATTERY_CAPACITY,$BATTERY_CHARGE,$BATTERY_CHARGE_DESIGN,$BATTERY_CHARGE_FULL,$BATTERY_CHARGE_FULL_DESIGN,$BATTERY_ENERGY_AVG" >> $BATTERY_LOG

	sleep 60
done
