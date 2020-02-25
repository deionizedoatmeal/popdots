#!/bin/bash

VOL=$(pacmd dump-volumes | awk 'NR==1{print $8}' | sed 's/\%//')
if [[ $VOL -lt 100 ]]; then
        (pactl set-sink-volume 0 +5%)
        (pactl set-sink-volume 1 +5%)
        (pactl set-sink-volume 2 +5%)
        (pactl set-sink-volume 3 +5%)
fi

