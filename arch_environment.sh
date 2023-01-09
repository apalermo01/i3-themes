sudo pacman -S --needed base-devel git
mkdir /tmp/yay-install
cd /tmp/yay-install
git clone https://aur.archlinux.arg/yay.git
cd yay
makepkg -si
