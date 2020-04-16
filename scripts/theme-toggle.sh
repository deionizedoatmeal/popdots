#!/bin/bash
# toggles light dark theme without changing the background
# uses pywal

IMG=$(cat ~/.fehbg | sed -n -e 's/^.*--bg-fill //p')
IMG="${IMG#?}"; IMG="${IMG%?}"; IMG="${IMG%?}"
THEME=$(head -1 ~/.cache/wal/colors | cut -c 2-2)

if [[ ${THEME} == "f" ]]; then
        wal -i ${IMG}
else
        wal -i ${IMG} -l
fi
