#!/bin/bash

# bluetooth status on
RETURN=""

# bluetooth connected
if [ "$(bluetoothctl info | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
    RETURN=""
fi

# bluetooth off
if [ "$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')" == "no" ]; then
    RETURN=""
fi


# device icon
ICON=""

#headphones
if [ "$(bluetoothctl info D8:AF:F1:A9:BE:D7 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	ICON=" "
fi
 
#earbuds
if [ "$(bluetoothctl info D1:64:9F:2F:F5:D3 | sed -n -e 's/^.*Connected: //p')" == "yes" ]; then
	ICON=""
fi

echo $ICON $RETURN


