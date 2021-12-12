# install spotify adblock
gh repo clone abba23/spotify-adblock-linux
cd spotify-adblock-linux/
sudo apt install git wget tar make gcc libc-dev
wget -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2
tar -xf cef.tar.bz2 --wildcards '*/include' --strip-components=1
make
sudo make install

