#!/bin/bash
# launches spotifyd and spotify-tui while listening to kill spotifyd when the tui is closed

spotifyd --device pulse --config-path $HOME/.config/spotifyd/config

spt

while true; do
        echo "whileloop"
        if [$(pgrep -x "spt") -eq ""] ; then
                killall spotifyd
                exit 1
        fi
done

