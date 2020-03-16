#!/usr/bin/env bash
(light -U 5)
LIGHT=$(light)
notify-send $LIGHT -h string:x-canonical-private-synchronous:anything
