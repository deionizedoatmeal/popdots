#!/usr/bin/env bash

PACKREMOVE='brltty geary gnome-calculator gnome-calendar gnome-contacts firefox gnome-weather yelp'

sudo apt autoremove -y $PACKREMOVE

echo 'package-uninstall.sh complete'
