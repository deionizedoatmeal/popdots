#!/bin/bash

if [ "$(bluetoothctl info | sed -n -e 's/^.*Connected: //p')" == "yes" ]
then
    echo ""
else
    echo ""
fi



