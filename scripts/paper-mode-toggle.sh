#!/bin/bash
# by ian k. bania 
# feb '20


#grepstuff=$(i3-msg -t get_tree | grep -oP 'gaps":{"inner":0,"outer":0,"top":0,"right":.{0,3}' | tail -1 | grep -o '.\{3\}$')
#grepstuff=$()
#grepstuff=$(i3-msg -t get_tree | grep -oP '750' | tail -1)
#grepstuff=$(i3-msg -t get_tree | grep -oP '.{0,250}"focused":true' | grep -oP 'right.{0,5}' | grep -o '.\{3\}$')
#GREPSTUFF=$(i3-msg -t get_tree | grep -oP '.{0,1500}"focused":true' | grep -oP 'gaps.{0,65}' | grep -oP '"right":.{0,3}' | cut -c 9-9)


I3MSG=$(i3-msg -t get_tree)
DELIM='"focused":true'
FOCUSED=${I3MSG%%${DELIM}*}
GAPS=${FOCUSED##*gaps}
DELIM='"right":'
RIGHT=${GAPS##*${DELIM}}
RIGHTVALUE=${RIGHT%%,*}

#echo ${RIGHTVALUE}

if [[ ${RIGHTVALUE} -eq 0 ]]; then
    i3-msg gaps right current set $1;
    i3-msg gaps left current set $1;
    i3-msg split h;
else
    i3-msg gaps right current set 0;
    i3-msg gaps left current set 0;
    i3-msg split v;
fi
