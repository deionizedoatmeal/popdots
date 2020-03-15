#!/bin/bash

# change the GDM background
read -r -p "Would you like to replace gdm background? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    sudo cp ../blurrr.jpg /usr/share/backgrounds/pop/kate-hazen-mort1mer.png
fi


# add PPAs

# .deb downloads
read -r -p "Would you like to download .deb files? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    wget https://github.com/chrisknepper/android-messages-desktop/releases/download/v3.1.0/android-messages-desktop_3.1.0_amd64.deb
fi


sudo apt update
sudo apt upgrade

# packages i use
SYS="ncdu gnupg2 openssh-client  macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon openvpn tty-clock dialog exfat-utils lm-sensors compton libxcb-render0-dev libffi-dev i3lock ffmpeg python-dev python-cffi fonts-fantasque-sans rofi mpg123 system76-driver pass imagemagick feh gnome-tweak-tool htop neovim python-neovim python3-neovim tlp tlp-rdw cmake python-pip python3-pip gcc powertop"
APPS="vlc torbrowser-launcher darktable inkscape neofetch steam atom blender gimp spotify-client zathura ranger" 
LAPTOP=""
DESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"

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


# install nvim plugin manager
read -r -p "Would you like to install vim-plug? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# install rust
read -r -p "Would you like to install rust? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# install rust packages
read -r -p "Would you like to install rust packages? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    cargo install spotify-tui
    cargo install -f --git https://github.com/cjbassi/ytop ytop
fi


# install spotifyd
read -r -p "Would you like to install Spotifyd v0.2.24? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    wget https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-full.tar.gz
    tar -xf spotify-linux-full.tar.gz
    sudo mv spotifyd /bin/spotifyd
fi


# install light utility
read -r -p "Would you like to install light (a backlight utility)? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    git clone https://github.com/haikarainen/light.git
    cd light
    ./autogen.sh
    ./configure
    make
    sudo make install
    cd ..
    sudo rm -r light
    echo 'backlight utility installed'
fi


# install python packages
read -r -p "Would you like to install python packages? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]
then
    sudo pip3 install pywal
    sudo pip install flashfocus
    sudo pip3 install protonvpn-cli
    sudo pip3 install inkscape-figures
    echo 'python packages installed'
fi

echo 'package install complete'
