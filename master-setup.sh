!#/bin/bash

# clone the repository with dot files and scripts
#cd
#git clone https://github.com/deionizedoatmeal/setup.git

# install packages
./package-install.sh

# remove packages
./package-uninstall.sh

# install airblader's i3gaps
#./setup/i3gaps-install.sh

# install jaagar's polybar
#./setup/polybar-install.sh

# configure i3, polybar, rofi, and zathura
#cp /setup/i3/congfig ~/.config/i3/config
#cp /setup/polybar/config ~/.config/polybar/config
#cp /setup/polybar/launch.sh ~/.config/polybar/launch.sh
#cp /setup/rofi/config ~/.config/rofi/config
#cp /setup/zarthura/zathurarc ~/.config/zathura/zathurarc
$echo 'congifs set up'

# move system scripts into bin
#sudo cp -p /setup/lock.sh /bin/lock
#sudo cp -p /setup/btheadphones_connect.sh /bin/btheadphones_connect
#sudo cp -p /setup/btheadphones_disconnect.sh /bin/btheadphones_disconnect
$echo 'scripts set up'

echo 'master set up complete'

