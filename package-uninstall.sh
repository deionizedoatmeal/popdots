#!/bin/bash

PACKREMOVE='brltty eog evince gedit geary gnome-calculator gnome-calendar gnome-contacts seahorse firefox gnome-weather language-selector-gnome totem yelp'

sudo apt autoremove -y $PACKREMOVE

echo 'package-uninstall.sh complete'
