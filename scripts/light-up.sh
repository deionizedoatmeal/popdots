#!/usr/bin/env bash
(light -A 5)
LIGHT=$(light)
notify-send $LIGHT -h string:x-canonical-private-synchronous:anything 
