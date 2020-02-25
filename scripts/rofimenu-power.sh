#!/bin/bash

rofi_command="rofi -lines 3 -width 15"
profile="$(system76-power profile | sed -n -e 's/^.*Profile: //p')"               


### Options ###
if [ "$profile" = "Performance" ]
then
    preformance=" performance <-"
else
    preformance=" performance"
fi

if [ "$profile" = "Balanced" ]
then
    balanced=" balanced <-"
else
    balanced=" balanced"
fi


if [ "$profile" = "Battery" ]
then
    battery=" battery <-"
else
    battery=" battery"
fi

# Variable passed to rofi
options="$preformance\n$balanced\n$battery"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "power profile" -selected-row 2)"
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

