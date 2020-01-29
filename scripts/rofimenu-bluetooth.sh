#!/bin/bash

rofi_command="rofi -height 4 -width 15"

### Options ###
first=" headphones"
second="ﳃ earbuds"
third="ﰝ speakers"
# Variable passed to rofi
options="$first\n$second\n$third"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "bluetooth" -selected-row 2)"
case $chosen in
    $first)
        bluetooth-device-toggle D8:AF:F1:A9:BE:D7
        ;;
    $second)
        bluetooth-device-toggle D1:64:9F:2F:F5:D3
        ;;
    $third)
        bluetooth-device-toggle 88:C6:26:21:AA:32
        ;;
esac

