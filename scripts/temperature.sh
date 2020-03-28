#!/bin/bash
# from https://gitlab.com/jennydaman/PigeonStats/-/blob/master/temperature.sh

disk="/dev/nvme0n1"
clear=$(tput sgr0)

printf "%s\n" "$(tput bold)Hardware Temperatures$clear"

function tcolor () {
  if [ "$1" -ge "$2" ]; then
    color=$(tput setab 196)
  elif [ "$1" -ge "$3" ]; then
    color=$(tput setab 3)
  elif [ "$1" -ge "$4" ]; then
    color=$(tput setab 2)
  else
    color=$(tput setab 6)
  fi
}

temp=$(sudo nvme smart-log $disk | grep "temperature" | cut -d ":" -f2 | cut -d " " -f2)
celcius="°C"
tcolor $temp 50 40 25
printf "\n%1s" " $color $disk $temp$celcius $clear" 
if [[ "$@" == *"--oneline"* ]]; then
    printf " "
else
    printf "\n\n"
fi


cpu_temps=""
col=0
while read -r core_name; do
  temp=$(sensors -uA | grep -A1 "$core_name" | awk '{if(/_input:/) print $2}')
  temp=$(printf "%.1f" "$temp")
  tcolor $(echo $temp | cut -f1 -d".") 70 60 25
  cpu_temps="${cpu_temps} $color CORE $(echo $core_name | tr -dc '0-9') $temp$celcius $clear "

  # print four cores per row
  ((col++))
  if [ "$col" -ge "4" ]; then
    printf "\n%s\n" "${cpu_temps}"
    cpu_temps=""
  fi
done <<< $(sensors -uA | grep Core)

[ -n "$cpu_temps" ] && printf "%s\n" "${cpu_temps}"

