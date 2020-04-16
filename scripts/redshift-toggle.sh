#!/bin/bash

if pgrep -x "redshift" >/dev/null
then
    killall -q redshift
else
    setsid redshift -r options & > /dev/null
fi
