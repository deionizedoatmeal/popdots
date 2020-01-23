#!/usr/bin/env bash

coproc bluetoothctl
echo -e 'disconnect' >&${COPROC[1]}
output=$(cat <&${COPROC[0]})
echo $output

exit 0
