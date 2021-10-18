# zsh, oh-my-zsh
echo "ZSH and OH-MY-ZSH configuring..."
sudo apt install curl zsh
#sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "ZSH and OH-MY-ZSH configuring DONE."

# gh
echo "GH CONFIGURING..."
sudo apt install git
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
gh login
echo "GH CONFIGURING DONE."

# touchegg
echo "TOUCHEGG CONFIGURING..."
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg
echo "TOUCHEGG CONFIGURING DONE."

# for applications source create folder
mkdir ~/Applications
cd ~/Applications

# installation conda
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
chmod +x Anaconda3-2021.05-Linux-x86_64.sh && ./Anaconda3-2021.05-Linux-x86_64.sh


# scrot-1.6
echo "SCTC CONFIGURING..."
# in Applications folder
gh repo clone ybgirgin3/SCTC
cd SCTC/
sudo apt remove scrot # which is version 1.2
sudo apt install autoconf autoconf-archive pkg-config libxcomposite-dev libxext-dev libxfixes-dev libimlib2-dev
gh repo clone resurrecting-open-source-projects/scrot
cd scrot/
./autogen && ./configure && make -j8 && sudo make install
cd ../
sudo apt install tesseract-ocr 
conda install -c conda-forge dbus-python
pip3 install -r requirements.txt

echo "SCTC CONFIGURING DONE"




# manuel package needed
echo "packages that requires manueal installation; google-chrome, mega, vscode
