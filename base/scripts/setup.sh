if [ ! -d ~/.config/i3/bin/ ]
then 
	mkdir ~/.config/i3/bin/
fi

cp ./base/scripts/rofifinder.sh ~/.config/i3/bin/rofifinder.sh
cp ./base/scripts/left_ext_monitor.sh ~/left_ext_monitor.sh
cp ./base/scripts/right_ext_monitor.sh ~/right_ext_monitor.sh 
