#!/bin/bash

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="i3-msg exit"

rofi_command="rofi -height 40"

options=$'poweroff\nreboot\nlogout\n' 

eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
