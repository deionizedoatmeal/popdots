#!/bin/bash

apt-get update
apt-get upgrade

#packages i use
PACK="libsox-fmt-mp3 sox cheese gnome-terminal net-tools xinput alsa-utils mupdf rxvt-unicode ffmpeg htop i3lock scrot imagemagick x11-session-utils nautilus ubuntu-drivers-common neovim python-neovim python3-neovim tlp tlp-rdw ranger neofetch steam atom blender gimp spotify-client gir1.2-gtop-2.0 lm-sensors cmake rofi google-chrome-stable python-pip python3-pip gcc powertop"
LAPPACK="system76-drivers"

#install apt packages
apt-get install -y $APPS4ian

#install python packages
pip3 install pywal

#install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

printf 'package install complete'
