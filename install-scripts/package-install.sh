#!/usr/bin/env bash

# add PPAs
sudo add-apt-repository -u ppa:snwh/ppa

# download debs
wget https://github.com/chrisknepper/android-messages-desktop/releases/download/v3.1.0/android-messages-desktop_3.1.0_amd64.deb

sudo apt update
sudo apt upgrade

# packages i use
SYS="libssl-dev speedtest-cli open-vpn tty-clock dialog exfat-utils golang-go lm-sensors compton libxcb-render0-dev libffi-dev i3lock ffmpeg python-dev python-cffi fonts-fantasque-sans paper-icon-theme rofi mpg123 system76-driver pass imagemagick feh gnome-tweak-tool vlc htop neovim python-neovim python3-neovim tlp tlp-rdw cmake python-pip python3-pip gcc powertop"
APPS="darktable inkscape neofetch steam atom blender gimp spotify-client zathura ranger android-messages-desktop_3.1.0_amd64.deb" 
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

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install rust packages
cargo install spotify-tui

# install light utility
git clone https://github.com/haikarainen/light.git
cd light
./autogen.sh
./configure
make
sudo make install
cd ..
sudo rm -r light
echo 'backlight utility installed'

# install go top
go get github.com/cjbassi/gotop
sudo mv ~/go/bin/gotop /bin/.


# install python packages
sudo pip3 install pywal
sudo pip install flashfocus
sudo pip3 install protonvpn-cli
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
