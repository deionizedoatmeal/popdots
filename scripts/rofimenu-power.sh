#!/bin/bash

poweroff_command="system76-power profile performance"
reboot_command="system76-power profile balanced"
logout_command="system76-power profile battery"

rofi_command="rofi"

options=$'performance\nbalanced\nbattery\n' 

eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
