# copy wallpaper
#cp ./trees/wallhaven-eymker.jpg ~/Pictures/wallpapers/wallhaven-eymker.jpg
cp ./trees/trees.jpg ~/Pictures/wallpapers/trees.jpg

THEMENAME=trees

# bashrc
cat ./$1/bashrc >> ~/.bashrc

# i3 config
cat ./$1/i3-config >> ~/.config/i3/config

# vimrc
if [ ! -f ./$1/blue_in_green.vim ]
then

	wget https://raw.githubusercontent.com/ewk/blue_in_green/main/colors/blue_in_green.vim -O ./$1/blue_in_green.vim
fi

cp ./$1/blue_in_green.vim ~/.vim/colors/blue_in_green.vim
cat ./$1/vimrc >> ~/.vimrc

# compton
cp ./$1/compton.conf ~/.config/compton.conf

# polybar
if [ ! -d ~/.config/polybar ]
then
	mkdir ~/.config/polybar
fi	
cp ./$1/polybar.ini ~/.config/polybar/config.ini 
cp ./$1/scripts/polybar_launch.sh ~/.config/polybar/launch.sh

### dependencies
sudo apt-get install xterm
sudo apt-get install suckless-tools
