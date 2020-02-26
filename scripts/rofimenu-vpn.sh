#!/bin/bash

rofi_command="rofi -lines 2 -width 15"

### Options ###
MSG=$(protonvpn s)
STATUS=$(echo $MSG | grep -o '^...........')
IP=$(echo $MSG | awk '/IP:/ {match($0, /IP:/); print substr($0, RSTART + 3, RLENGTH + 11);}')

if [ "$STATUS" == "Status: Con" ]
then
    zero=" connect vpn <-"
else
    zero=" connect vpn"
fi


if [ "$STATUS" == "Status: Dis" ]
then
    first=" disconnect vpn <-"
else
    first=" disconnect vpn"
fi

# Variable passed to rofi
options="$zero\n$first"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "vpn$IP" -selected-row 2)"
case $chosen in
    $zero)
        sudo protonvpn -f c
        ;;
    $first)
        sudo protonvpn d
esac

