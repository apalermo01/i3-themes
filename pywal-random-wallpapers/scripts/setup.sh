#!/bin/bash

# theme-specific dependencies
pip install --user bumblebee-status
pip install --user pywal

# copy wallpapers

# bashrc
cat ./$1/bashrc >> ~/.bashrc

# wallpaper setter
cp ./$1/scripts/set_wp.sh ~/.set_wp.sh

# i3 config
cat ./$1/i3-config >> ~/.config/i3/config

# picom
cp ./$1/picom.conf ~/.config/picom.conf

# download some wallpapers
mkdir ~/Pictures/wallpapers
cp  ./pywal-random-wallpapers/backgrounds/* ~/Pictures/wallpapers
