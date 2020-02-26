#!/bin/bash

if [ "$(protonvpn s | sed -n -e 's/^.*Status:       //p')" == "Connected" ]
then
    echo "|"
else
    echo ""
fi

