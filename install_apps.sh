## GOODIES INSTALLATION ##
# For Automating Apps and Terminal Utilities
# No DE dependency
# Ubuntu
## Yusuf Berkay Girgin 31 October 2021 23:48


# TERMINAL GOODIES w/o gui
sudo apt install software-properties-common apt-transport-https wget
sudo apt remove vim           # remove old vim
sudo apt install neovim       # neovim better than vim
sudo apt install tmux         # best solution for spliting terminal screen                      
sudo apt install subversion   # for cloning specific folder of repos


sudo apt install screenfetch  # for info
sudo apt install cmatrix      # for fun 🤟

### APPLICATIONS ###
# -- no configuration needed apps w/ gui
sudo apt install google-chrome-stable   # for internet
sudo apt install discord                # for meetings
sudo apt install zoom                   # for facetime
sudo apt install kdenlive               # video editing 📼
sudo apt install breeze                 # for having dark theme in kdenlive
sudo apt install sqlitebrowser          # for sql dbs
sudo apt install geary                  # emails 📬
sudo apt install obs-studio             # screen recording 💻


# -- configuration needed apps
# - vscode: 1st code editor
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# - sublime text: 2nd code editor
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


# - spotify: for music
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


# - touchegg: for trackpad shortcuts
sudo add-apt-repository ppa:touchegg/stable
sudo apt install touchegg     
