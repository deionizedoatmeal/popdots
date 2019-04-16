#!/bin/bash

# add PPAs

sudo apt update && upgrade

# packages i use
PACK="arduino libsox-fmt-mp3 sox vlc cheese gnome-terminal net-tools xinput alsa-utils mupdf rxvt-unicode ffmpeg htop i3lock scrot imagemagick x11-session-utils nautilus ubuntu-drivers-common neovim python-neovim python3-neovim tlp tlp-rdw ranger neofetch steam atom blender gimp spotify-client gir1.2-gtop-2.0 lm-sensors cmake rofi google-chrome-stable python-pip python3-pip gcc powertop"
LAPPACK="system76-driver"
DESKPACK="system76-driver-nvidia"

# install apt packages
sudo apt install -y $PACK

# desktop or laptop packages
read -r -p "Would you like to install packages for (L)aptop, or (D)esktop? [L/D/n] " response
if [[ "$response" =~ ^([Ll])+$ ]]
then
    sudo apt install -y $LAPPACK 
fi
if [[ "$response" =~ ^([Dd])+$ ]]
then
    sudo apt install -y $DESKPACK
fi


# install python packages
pip3 install pywal

# install fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh

echo 'package install complete'
