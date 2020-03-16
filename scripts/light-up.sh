#!/bin/bash
(light -A 5)
LIGHT=$(light -G | awk -F'.' '{print $1}')
notify-send  $LIGHT -h string:x-canonical-private-synchronous:anything 
