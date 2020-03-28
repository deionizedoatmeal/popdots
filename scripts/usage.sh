#!/bin/bash
# from https://gitlab.com/jennydaman/PigeonStats/-/blob/master/usage.sh

filesystems="/dev/nvme0n1p3"
width=50
threshold=80

clear=$(tput sgr0)
dim=$(tput dim)

function printbar() {
  local percent=$1
  local used_bar_width=$((($percent*$width)/100))

  if [ "$percent" -ge "$threshold" ]; then
    bar=$(tput setaf 1)
  else
    bar=$(tput setaf 2)
  fi

  for sep in $(seq 1 $used_bar_width); do
      bar="$bar="
  done
  bar="$bar$clear$dim"
  for sep in $(seq 1 $(($width-$used_bar_width))); do
  
      bar="$bar="
  done
  echo -e " [$bar$clear]"
}

# mountpoint usage bars

df_info="$(df -hl)"
echo " ${df_info}" | head -n 1

for point in ${filesystems}; do
  line=$(echo "${df_info}" | grep $point)
  
  usage_percent=$(echo "$line" | awk '{print $5;}' | sed 's/%//')

  echo " ${line}"|tail -n1
  printbar $usage_percent
done

# memory bars

printf "\n"

function memory () {

  local free_info=$(free -m | grep $1)
  local mem_total=$(echo $free_info | awk '{print $2;}')
  local mem_used=$(echo $free_info | awk '{print $3;}')
  printf "%-21s%31s\n" " $2" "$mem_used / $mem_total"
  printbar $(($mem_used*100/$mem_total))
}

memory "Mem" "Memory"
memory "Swap" "Swap"

