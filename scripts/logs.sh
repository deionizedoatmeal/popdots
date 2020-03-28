#!/bin/bash
# from https://gitlab.com/jennydaman/PigeonStats/-/blob/master/logs.sh
# prints the most recent activity from the specified logfile
# for a given number of unique IP addresses.


logfile=/var/log/auth.log
self=192.168.1.1
max_results=10
max_history=1000

function unique_ips() {
  logs=$(grep --invert-match "$self" "$logfile" | tail -n $max_history | tac)
  ip_array=$(awk '{ print $1 }' <<< $logs | uniq | cat -n | sort +1 -u | sort -n | awk '{ print $2}')
  head -n $max_results <<< $ip_array | while read addr; do
    grep -m 1 -F --color $addr <<< $logs
  done
}


echo "Recent activity from $logfile:"
unique_ips


