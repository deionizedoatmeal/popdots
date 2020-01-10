#!/usr/bin/env bash
# canibalized from @petvas i3lock-blur https://github.com/petvas/i3lock-blur.git
# drop this bad boy in your bin, and the lock icon in the i3 config directory, then just call 'exec lock' in your i3 config file, or just use lock as a command

TMPBG=/tmp/screen.png
LOCK=$HOME/.config/i3/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=20,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

i3lock -i $TMPBG
rm $TMPBG
