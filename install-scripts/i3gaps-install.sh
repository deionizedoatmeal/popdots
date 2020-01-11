#!/usr/bin/env bash

# install dependencies
sudo apt install -y git wget curl zip unzip libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

cd /tmp

# clone the repository
git clone https://github.com/resloved/i3.git
cd i3

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# disabling sanitizers is important for release versions
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

echo 'i3gaps-install.sh has completed'
