#!/bin/bash

PACKREMOVE='brltty eog evince gedit geary gnome-calculator gnome-calendar gnome-contacts seahorse language-selector-gnome totem yelp ghostscripzt-x'

sudo apt autoremove -y $PACKREMOVE

echo 'package-uninstall.sh complete'
