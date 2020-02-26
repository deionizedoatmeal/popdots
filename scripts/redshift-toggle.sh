#!/bin/bash

if pgrep -x "redshift" >/dev/null
then
    killall -q redshift
else
    setsid redshift options & > /dev/null
fi
