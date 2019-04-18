#!/bin/bash

PACKREMOVE='baobab brltty eog evince gedit geary gnome-calculator gnome-calendar gnome-contacts gnome-cotrol-center gnome-font-viewer gnome-screenshot gnome-system monitor gnome-weather seahorse language-selector-gnome totem yelp ghostscript-x"

sudo apt autoremove -y $PACKREMOVE

echo 'package-uninstall.sh complete'
