### some packages
sudo pacman -S neofetch i3lock

### yay
# https://www.makeuseof.com/install-and-use-yay-arch-linux/
sudo pacman -S --needed base-devel git
mkdir /tmp/yay/
cd /tmp/yay/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

### brave
yay -S brave-bin

### pip
sudo pacman -S python-pip

### bumblebee-status
mkdir /tmp/bumblebee-status
cd /tmp/bumblebee-status
git clone https://aur.archlinux.org/bumblebee-status.git
cd bumblebee-status
makepkg -sicr
cd ~

### feh
sudo pacman -S feh
