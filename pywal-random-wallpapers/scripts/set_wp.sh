#!/bin/bash

WPNAME=$(ls $HOME/Pictures/wallpapers/ | shuf -n 1)
echo $HOME/Pictures/wallpapers/$WPNAME > ~/.current_background
feh --bg-fill $HOME/Pictures/wallpapers/$WPNAME

