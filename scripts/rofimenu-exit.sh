#!/bin/bash

rofi_command="rofi -height 4 -width 15"

### Options ###
power_off=" poweroff"
reboot=" reboot"
lock=" lock"
log_out=" logout"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p "session" -selected-row 2)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        lock
        ;;
    $log_out)
        i3-msg exit
        ;;
esac

