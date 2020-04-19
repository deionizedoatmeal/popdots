#!/bin/bash

sudo cryptsetup open /dev/${1} ${1}
sudo mount /dev/mapper/${1} ${2}
