#!/bin/bash

printf " %s%22s\n\n" "$(tput bold)Processes$(tput sgr0)" "$(ps -A --no-headers | wc -l) running"
ps -Ao comm,pid,pcpu,tty --sort=-pcpu | head -n 6

