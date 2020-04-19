#!/bin/bash

sudo cryptsetup open /dev/${1} external
sudo mount /dev/mapper/external /mnt/external/
