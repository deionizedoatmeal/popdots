#!/bin/bash

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="i3-msg exit"
lock="lock"

rofi_command="rofi -height 4 -width 10"

options=$' poweroff\n reboot\n lock\n logout\n' 
 
eval \$"$(echo "$options" | $rofi_command -dmenu -p "session")_command"
