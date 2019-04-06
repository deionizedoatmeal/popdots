#!/bin/bash
#ian's basic package setup and cleaning of fresh ubuntu 18.04 install

apt-get install software-properties-common

#stuff for my system-76 made laptop
#apt-add-repository -y ppa:system76-dev/stable

#spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list

#atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

#chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

apt-get update
apt-get upgrade

#packages i use
APPS4ian="net-tools xinput alsa-utils mupdf rxvt-unicode ffmpeg htop i3lock scrot imagemagick x11-session-utils nautilus lightdm lightdm-mini-greeter neovim python-neovim python3-neovim tlp tlp-rdw chromium-browser ranger neofetch steam atom blender gimp spotify-client gir1.2-gtop-2.0 lm-sensors cmake stterm rofi google-chrome-stable python-pip python3-pip gcc powertop"

#apt-get install system76-drivers

apt-get install -y $APPS4ian

pip3 install pywal

git clone https://github.com/ryanoasis/nerd-fonts.git

cd nerd-fonts

./install.sh

