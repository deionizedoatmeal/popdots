#!/bin/bash
echo "System has been" $(uptime --pretty)

clear=$(tput sgr0)
last_apt_d=$(tac /var/log/apt/history.log | grep -m1 -F "Start-Date: " | cut -d " " -f2)
last_apt_t=$(tac /var/log/apt/history.log | grep -m1 -F "Start-Date: " | cut -d " " -f4)
last_apt=$last_apt_d" "$last_apt_t

time_since=$((($(date +%s)-$(date --date="$last_apt" +%s))/3600))
echo "It has been $(tput bold)$time_since hour$([ $time_since -ne 1 ] && echo s)$clear since your last $(tput setaf 6)apt upgrade$clear"

