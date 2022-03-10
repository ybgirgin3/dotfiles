# clone repo
gh repo clone Luwx/Lightly

# change dir
cd Lightly

# install deps
sudo pacman -S cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras

# build 
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
make -j10

# install
sudo make install
