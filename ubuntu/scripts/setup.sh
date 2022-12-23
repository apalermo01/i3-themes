THEME=$1
echo "THEME is $1"
cat ./"$1"/.config/i3/config >> ~/.config/i3/config
