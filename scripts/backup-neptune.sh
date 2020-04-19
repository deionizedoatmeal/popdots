#!/bin/bash

sudo rdiff-backup -v5 --exclude '/home/ian/.*' /home/ian/ /mnt/neptune_backup/
