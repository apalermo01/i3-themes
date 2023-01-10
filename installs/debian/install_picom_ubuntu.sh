mkdir /tmp/picom/
cd /tmp/picom/
git clone https://github.com/jonaburg/picom
cd picom
meson --buildtype=release . build
ninja -C build
cd ~

