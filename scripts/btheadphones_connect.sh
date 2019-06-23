#!/usr/bin/env bash

coproc bluetoothctl
echo -e 'connect D8:AF:F1:A9:BE:D7' >&${COPROC[1]}
output=$(cat <&${COPROC[0]})
echo $output
