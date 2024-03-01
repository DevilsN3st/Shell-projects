#!/bin/bash
#libnotify-bin, mpg123, acpi

while true
do
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    ac_power=$(acpi -b | grep -c "Charging")
if [ $battery_level -ge 80 ] && [ $ac_power -eq 1 ];
then
    notify-send "Battery High ($battery_level %)" "Please Disconnect Charger" && mpg123 notificacion.mp3
elif [ $battery_level -le 20 ] && [ $ac_power -eq 0 ];
then
    notify-send "Battery Low ($battery_level %)" "Time to put the laptop on Charging mode" && mpg123 battery_low.mp3
fi

sleep 120

done
