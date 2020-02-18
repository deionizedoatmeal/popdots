#!/bin/bash
# by ian k. bania 
# feb '20


#grepstuff=$(i3-msg -t get_tree | grep -oP 'gaps":{"inner":0,"outer":0,"top":0,"right":.{0,3}' | tail -1 | grep -o '.\{3\}$')
#grepstuff=$()
#grepstuff=$(i3-msg -t get_tree | grep -oP '750' | tail -1)

grepstuff=$(i3-msg -t get_tree | grep -oP '.{0,250}"focused":true' | grep -oP 'right.{0,5}' | grep -o '.\{3\}$')

echo $grepstuff

if [ $grepstuff -eq 750 ]; then
    i3-msg gaps right current set 0;
    i3-msg gaps left current set 0;
    i3-msg split h;
else
    i3-msg gaps right current set 400;
    i3-msg gaps left current set 400;
    i3-msg split v;
fi
