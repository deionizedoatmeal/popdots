#!/bin/bash
# by ian k. bania (feb '20)
# lets me easily compare my local differences in dotfiles to the ones in the repo, so i dont overwrite any edits i've made locally

echo "#####i3/config######"
diff ../i3/config ~/.config/i3/config
echo "#####polybar/config######"
diff ../polybar/config ~/.config/polybar/config
echo "#####polybar/launch.sh######"
diff ../polybar/launch.sh ~/.config/polybar/launch.sh
echo "#####rofi/config######"
diff ../rofi/config ~/.config/rofi/config
echo "#####compton/compton.conf######"
diff ../compton/compton.conf ~/.config/compton/compton.conf
echo "#####zathura/zathurarc######"
diff ../zathura/zathurarc ~/.config/zathura/zathurarc
echo "#####ranger/rc.conf######"
diff ../ranger/rc.conf ~/.config/ranger/rc.conf
echo "#####ranger/rifle.conf######"
diff ../ranger/rifle.conf ~/.config/ranger/rifle.conf
echo "#####nvim/init.vim######"
diff ../nvim/init.vim ~/.config/nvim/init.vim
echo "#####dunst/dunstrc######"
diff ../dunst/dunstrc ~/.config/dunst/dunstrc
echo "#####wal/templates/colors-rofi-dark.rasi#####"
diff ../wal/templates/colors-rofi-dark.rasi ~/.config/wal/templates/colors-rofi-dark.rasi
echo "#####.bashrc######"
diff ../.bashrc ~/.bashrc
echo "#####.Xresources######"
diff ../.Xresources ~/.Xresources 
echo "#####chrome/userChrome.css######"
diff ../chrome/userChrome.css ~/.mozilla/firefox/*.default-release/chrome/userChrome.css
echo "#####chrome/userContent.css######"
diff ../chrome/userContent.css ~/.mozilla/firefox/*.default-release/chrome/userContent.css


echo "###############SCRIPTS################"

cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        echo "##########"
        echo $NAME
        diff $f /bin/$NAME 
done

for f in *.py; do
        NAME=${f::-3}
        echo "##########"
        echo $NAME
        diff $f /bin/$NAME 
done
