#!/bin/bash
# by Ian K. Bania 
# Jan '20

profile="$(system76-power profile | sed -n -e 's/^.*Profile: //p')"

if [ "$profile" = "Battery" ]
then
    echo "|"
fi

if [ "$profile" = "Balanced" ]
then
    echo "|"
fi

if [ "$profile" = "Performance" ]
then
    echo "|"
fi


