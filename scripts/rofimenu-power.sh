#!/bin/bash

preformance_command="system76-power profile performance"
balanced_command="system76-power profile balanced"
battery_command="system76-power profile battery"

rofi_command="rofi"

options=$'performance\nbalanced\nbattery\n' 

eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
