# what this is
I plan on using this repository as a way to manage dotfiles, configs, install scripts and functionality scripts for my different machines. Currently what that means is a Pop_OS 18.10 install, with i3-gaps, compoton, nvim, zathura, rofi, polybar, chromium, spotify, gimp, and nautilus, and among other software. In terms of workflow, I use my laptop for notetaking in LaTeX, reading textbook pdfs and academic papers, writing scientific and engineering code, CAD modeling, raspberryPi projects, running numerical simulations, and web browsing. Eventually I hope to get this repository organized to the point with install scripts that someone using ubuntu, or Pop_OS could fairly easily replicate this system.

# installation
To replicate my system, clone the repositoty:
``` cd && git clone https://github.com/deionizedoatmeal/setup.git ```
Then exceute the master script:
``` ./setup/master.sh ```
This will install all of my perfered packages, remove some default Pop_OS packages, install i3-gaps and polybar from source, and then place the apropriate configs and scripts where they need to go. 
Note: you may need to change the permissions on the scripts after downloading them to make them executable.
``` sudo chmod +111 ~/setup/*.sh ```

To just install polybar or i3gaps, the `polybar-install.sh` and `i3gaps-install.sh` should include all the necesary dependencies and work in isolation. 

# usage
As most of this is just coubled together snipetts of bash code, and lists of dependencies from around the web, feel free to use any and all of this however you want. When begining with i3 I found it particularly annoying to set up sound, backlight, lock, session exit, battery profile, bluetooth, screenshot and media key controls from scratch, so hopefully this reposititory provides a more robust and polished i3 experience for others. 
