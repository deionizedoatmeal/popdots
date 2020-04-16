#!/usr/bin/env bash
# canibalized from @petvas i3lock-blur https://github.com/petvas/i3lock-blur.git
# drop this bad boy in your bin, and the lock icon in the i3 config directory, then just call 'exec lock' in your i3 config file, or just use lock as a command

TMPBG=/tmp/screen.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
MAINRES=$(xrandr | grep -o -P 'primary.{0,10}' | cut -c 9-17)

#DO MATH DO CENTER ONE OF THE MONITORS
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -filter_complex "boxblur=100" -vframes 1 $TMPBG -loglevel quiet



i3lock -ei $TMPBG
rm $TMPBG
