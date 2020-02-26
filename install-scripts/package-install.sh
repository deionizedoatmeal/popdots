#!/usr/bin/env bash

# change the GDM background 
sudo cp ../blurrr.jpg /usr/share/backgrounds/pop/kate-hazen-mort1mer.png 

# add PPAs
sudo add-apt-repository -u ppa:snwh/ppa
sudo add-apt-repository "deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"

# .deb downloads
wget https://github.com/chrisknepper/android-messages-desktop/releases/download/v3.1.0/android-messages-desktop_3.1.0_amd64.deb


sudo apt update
sudo apt upgrade

# packages i use
SYS="android-file-transfer macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon open-vpn tty-clock dialog exfat-utils lm-sensors compton libxcb-render0-dev libffi-dev i3lock ffmpeg python-dev python-cffi fonts-fantasque-sans paper-icon-theme rofi mpg123 system76-driver pass imagemagick feh gnome-tweak-tool vlc htop neovim python-neovim python3-neovim tlp tlp-rdw cmake python-pip python3-pip gcc powertop"
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


# install nvim plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install rust packages
cargo install spotify-tui
cargo install -f --git https://github.com/cjbassi/ytop ytop

# install spotifyd
https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-full.tar.gz
tar -xf spotify-linux-full.tar.gz
sudo mv spotifyd /bin/spotifyd

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

# install python packages
sudo pip3 install pywal
sudo pip install flashfocus
sudo pip3 install protonvpn-cli
sudo pip3 install inkscape-figures
echo 'python packages installed'

echo 'package install complete'
