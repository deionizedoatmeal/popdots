#!/bin/bash

pgrep -x redshift >/dev/null && killall -q redshift || setsid redshift options & > /dev/null

