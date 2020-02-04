#!/bin/bash

rofi_command="rofi -height 4 -width 15"

### Options ###
zero=" power toggle"
first=" headphones"
second=" earbuds"
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

