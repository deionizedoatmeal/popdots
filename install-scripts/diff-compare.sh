#!/bin/bash
# by ian k. bania (feb '20)
# lets me easily compare my local differences in dotfiles to the ones in the repo, so i dont overwrite any edits i've made locally

echo "##### i3/config ######"
diff ../i3/config ~/.config/i3/config
echo "##### polybar/config ######"
diff ../polybar/config ~/.config/polybar/config
echo "##### polybar/launch.sh ######"
diff ../polybar/launch.sh ~/.config/polybar/launch.sh
echo "##### rofi/config ######"
diff ../rofi/config ~/.config/rofi/config
echo "##### compton/compton.conf ######"
diff ../compton/compton.conf ~/.config/compton/compton.conf
echo "##### zathura/zathurarc ######"
diff ../zathura/zathurarc ~/.config/zathura/zathurarc
echo "##### spotify-tui/config.yml ######"
diff ../spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "##### spotifyd/config ######"
diff ../spotifyd/config ~/.config/spotifyd/config
echo "##### ranger/rc.conf ######"
diff ../ranger/rc.conf ~/.config/ranger/rc.conf
echo "##### ranger/rifle.conf ######"
diff ../ranger/rifle.conf ~/.config/ranger/rifle.conf
echo "##### nvim/init.vim ######"
diff ../nvim/init.vim ~/.config/nvim/init.vim
echo "##### wal/templates/colors-rofi-dark.rasi #####"
diff ../wal/templates/colors-rofi-dark.rasi ~/.config/wal/templates/colors-rofi-dark.rasi
echo "##### wal/templates/dunstrc #####"
diff ../wal/templates/dunstrc ~/.config/wal/templates/dunstrc
echo "##### .bashrc ######"
diff ../.bashrc ~/.bashrc
echo "##### .Xresources ######"
diff ../.Xresources ~/.Xresources 
echo "##### chrome/userChrome.css ######"
diff ../chrome/userChrome.css ~/.mozilla/firefox/*.default-release/chrome/userChrome.css
echo "##### chrome/userContent.css ######"
diff ../chrome/userContent.css ~/.mozilla/firefox/*.default-release/chrome/userContent.css
echo "##### ranger/ranger.desktop ######"
diff ../ranger/ranger.desktop /usr/share/applications/ranger.desktop
echo "##### spotify-tui/spotify-tui.desktop ######"
diff ../spotify-tui/spotify-tui.desktop /usr/share/applications/spotify-tui.desktop

echo "

"
echo "############### SCRIPTS ################"

cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        diff $f /bin/$NAME 
done

for f in *.py; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        diff $f /bin/$NAME 
done
