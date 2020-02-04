#/bin/bash

status=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')

if [ "$status" == "no" ]
then
    bluetoothctl power on
else
    bluetoothctl power off
fi

