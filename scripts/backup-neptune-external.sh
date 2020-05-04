#!/bin/bash

echo \ 
lsblk
echo \ 
read -r -p "IS EVERYTHING MOUNTED THAT NEEDS TO BE??? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
    sudo rdiff-backup -v5 --exclude '/home/ian/.*' /home/ian/ /mnt/external/
fi
