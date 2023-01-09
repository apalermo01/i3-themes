#!/bin/bash
# setup script for replacing themes
# adapted from https://github.com/Kthulu120/i3wm-themes/blob/master/scripts/apply_theme.sh

echo "Setting up template $1"

if [ -d ./$1/ ]
then
	echo "[+] found theme folder"
else
	echo "[-] could not find theme folder, exiting"
	exit
fi

### backup ####################################################################
read -p "Backup current theme? [y, n]" input
case $input in
	y|Y)

	echo "[*] backing up theme"
	
	# make backup directory
	if ! [ -d ~/Documents/Theme_backups/ ]
	then
		echo "[*] making backup directory"
		mkdir ~/Documents/Theme_backups
	fi

	# make directory for this backup
	while :
	do
		read -p "enter a name for the backup folder: " foldername
		if [ -d ~/Documents/Theme_backups/$foldername/ ]
		then 
			echo "folder already exists, pick another name"
		else
			BACKUP_PATH=~/Documents/Theme_backups/$foldername
			mkdir $BACKUP_PATH
			break
		fi
	done

	### copy folders that would be overwritten into directory
	# i3 config
	if [[ -d ~/.config/i3/ ]]
	then
		mkdir -p $BACKUP_PATH/.config/i3
		cp ~/.config/i3/* $BACKUP_PATH/.config/i3/
		echo "[+] copied ~/.config/.i3/config to backup"
	fi

	# bashrc
	if [ -f ~/.bashrc ]
	then
		cp ~/.bashrc $BACKUP_PATH/.bashrc
		echo "[+] copied ~/.bashrc to backup"
	fi

	# vimrc
	if [ -f ~/.vimrc ]
	then 
		cp ~/.vimrc $BACKUP_PATH/.vimrc
		echo "[+] copied ~/.vimrc to backup"
	fi

	# Xresources
	if [ -f ~/.Xresources ]
	then
		cp ~/.Xresources $BACKUP_PATH/.Xresources
		echo "[+] copied ~/.Xresources to backup"
	fi

	if [ -f ~/.extend.Xresources ]
	then
		cp ~/.extend.Xresources $BACKUP_PATH/.extend.Xresources
		echo "[+] copied ~/.extend.Xresources to backup"
	fi	
	echo "[+] backup complete"
esac

if ! [[ -d ~/.config/i3 ]]
then
	mkdir ~/.config/i3
fi

### remove files from previous config ########################################
if [ -d ~/.config/polybar ]
then
	rm -r ~/.config/polybar
fi

### copy files ################################################################
cp ./base/i3-config ~/.config/i3/config
cp ./base/bashrc ~/.bashrc
cp ./base/vimrc ~/.vimrc
cp ./base/Xresources ~/.Xresources

### echo os-specific bindsyms ################################################
case $2 in
	arch)
		echo "bindsym $mod+b exec brave" >> ~/.config/i3/config
		;;
	*) # expect this to be any debian-based distro
		echo "bindsym $mod+b exec brave-browser" >> ~/.config/i3/config
	    	
		;;
esac
# copies base configs into the right directories
./base/scripts/setup.sh

# sets up theme specific configs, appends the contents of configs in the theme
# specific folder to the contents of the base configs
./$1/scripts/setup.sh $1

# make file for environment variables
if [ -f ~/.envs ]
then
	cat ~/.envs >> ~/.bashrc
else
	echo "if you want to keep environment variables in your bashrc, put those in ~/.envs and I will cat that into ~/.bashrc whenever the theme is reset. I couldn't find one, so I'm going to make one for you"
	touch ~/.envs
fi
