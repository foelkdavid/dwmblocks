#!/bin/sh
percentage=$(acpi | awk '{print $4}' | sed s'/..$//' | head -n1)
#status=$(acpi | awk '{print $3}' | sed s'/.$//' | head -n1)
batstatus=$(cat /sys/class/power_supply/BAT0/status)
status=$(cat /sys/class/power_supply/AC/online)

if [ $status == 0 ]
then
    case $((
        ($percentage >= 0 && $percentage <= 10)     * 1 +
        ($percentage > 10 && $percentage <= 40)     * 2 +
        ($percentage > 40 && $percentage <= 70)     * 3 +
        ($percentage > 70 && $percentage <= 90)     * 4 +
        ($percentage > 90 && $percentage <= 100)    * 5)) in
        (1) echo " $percentage%";;
        (2) echo " $percentage%";;
        (3) echo " $percentage%";;
        (4) echo " $percentage%";;
        (5) echo " $percentage%";;
        (0) echo " $percentage%";;
    esac
elif [ $batstatus == "Full" ]
then
	echo ""

elif [ $status == 1 ]
then
    echo " $percentage%"
	
else
    echo ""
fi


