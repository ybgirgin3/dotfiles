# install spotify adblock
# gh repo clone abba23/spotify-adblock-linux
# wget -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2
# tar -xf cef.tar.bz2 --wildcards '*/include' --strip-components=1
# make
# sudo make install

sudo apt update
sudo apt install git wget tar make gcc libc-dev cargo
gh repo clone abba23/spotify-adblock
cd spotify-adblock/
make
