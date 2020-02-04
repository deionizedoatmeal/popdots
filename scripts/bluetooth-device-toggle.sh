#!/bin/bash
# this garbage was written by ian k. bania in jan '20
# takes the device address as an argument, toggles the connection

address=$1

i=0


echo $(bluetoothctl info $address | sed -n -e 's/^.*Connected: //p')

if [ "$(bluetoothctl info $address | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    echo "connected, going to disconnect"
    bluetoothctl disconnect $address
else
    echo "not connected, going to connect"
    while [ "$(bluetoothctl info $address | sed -n -e 's/^.*Connected: //p')" == "no" ]
    do
        bluetoothctl connect $address
        sleep 2
        ((i++))
        if [[ "$i" == '10' ]]
        then
            break
        fi
    done
fi



