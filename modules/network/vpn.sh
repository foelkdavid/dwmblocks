#!/bin/bash

#DEVICE=$(nmcli device | grep connected | awk '{print $1}' | head -n 1)
STATE="0"
STATE=$(nmcli | grep tun | head -n 1 | awk '{print $2}')

if [ $STATE == ""]
then
	echo "no vpn"
elif [ $STATE == "connected" ]
then
        echo ""
else
    echo "error"
fi
