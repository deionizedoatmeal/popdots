#!/bin/bash

sudo rsync -avzP --exclude ".*" -e ssh /home/ian/ ian@192.168.0.111:/home/ian/
