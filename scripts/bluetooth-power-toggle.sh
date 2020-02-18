#!/bin/bash
# by ian k. bania
# feb '20

status=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')

if [ "$status" == "no" ]
then
    rfkill unblock bluetooth
    bluetoothctl power on
else
    bluetoothctl power off
    rfkill block bluetooth
fi

