#!/bin/bash

rofi_command="rofi -lines 3 -width 15"

### Options ###
zero=" power toggle"

if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    first=" headphones <-"
else
    first=" headphones"
fi

if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    second=" earbuds <-"
else
    second=" earbuds"
fi

# Variable passed to rofi
options="$zero\n$first\n$second"

status=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')
if [ "$status" == "no" ]
then
   echo "its off 1" 
   onoff="off"
else
    echo "its on 2"
    onoff="on"
fi

echo $onoff

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "bluetooth $onoff" -selected-row 2)"
case $chosen in
    $zero)
        bluetooth-power-toggle
        ;;
    $first)
        bluetooth-device-toggle D8:AF:F1:A9:BE:D7
        ;;
    $second)
        bluetooth-device-toggle D1:64:9F:2F:F5:D3
        ;;
esac

