#!/bin/bash

rofi_command="rofi -height 4 -width 15"

### Options ###
preformance=" preformance"
balanced=" balanced"
battery=" battery"
# Variable passed to rofi
options="$preformance\n$balanced\n$battery"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "profile" -selected-row 2)"
case $chosen in
    $preformance)
        system76-power profile performance
        ;;
    $balanced)
        system76-power profile balanced
        ;;
    $battery)
        system76-power profile battery
        ;;
esac

