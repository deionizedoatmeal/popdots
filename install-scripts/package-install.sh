#!/usr/bin/env bash

# add PPAs
sudo add-apt-repository -u ppa:snwh/ppa

sudo apt update
sudo apt upgrade

# packages i use
SYS="compton libxcb-render0-dev libffi-dev i3lock ffmpeg python-dev python-cffi fonts-fantasque-sans paper-icon-theme rofi mpg123 system76-driver pass imagemagick zathura feh gnome-tweak-tool vlc htop neovim python-neovim python3-neovim tlp tlp-rdw ranger cmake python-pip python3-pip gcc powertop"
APPS="darktable pinta neofetch steam atom blender gimp spotify-client google-chrome-stable" 
LAPTOP=""
DESKTOP="system76-driver-nvidia"


# install apt packages
sudo apt install -y $SYS

# which packages
read -r -p "Would you like to install applications (optional)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    sudo apt install -y $APPS
fi

read -r -p "Would you like to install laptop software (optional)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    sudo apt install -y $LAPTOP
fi

read -r -p "Would you like to install desktop software (optional)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    sudo apt install -y $DESKTOP
fi
echo 'apt packages installed'

# install light utility
git clone https://github.com/haikarainen/light.git
cd light
./autogen.sh
./configure && make
sudo make install
cd ..
sudo rm -r light
echo 'backlight utility installed'


# install python packages
sudo pip3 install pywal
sudo pip install flashfocus
echo 'python packages installed'


# install fonts WARNING LARGE
read -r -p "Would you like to install fonts (WARNING LARGE)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    git clone https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    ./install.sh
fi
echo 'fonts installed'
echo 'package install complete'
