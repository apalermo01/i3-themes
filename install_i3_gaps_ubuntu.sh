# references
# https://askubuntu.com/questions/1415720/ubuntu-22-04-jammy-jellyfish-cannot-install-i3-gaps
# https://www.reddit.com/r/i3wm/comments/aqq0i0/no_package_xcbshape_found_when_trying_to_install/

# ensure that i3 is not installed
sudo apt remove i3

sudp apt install meson

# install dependencies
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

mkdir /tmp/build
cd /tmp/build
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
meson -Ddocs=true -Dmans=true ../build
meson compile -C ../build
sudo meson install -C ../build
