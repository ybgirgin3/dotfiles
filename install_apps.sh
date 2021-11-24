## GOODIES INSTALLATION ##
# For Automating Apps and Terminal Utilities
# No DE dependency
# Ubuntu
## Yusuf Berkay Girgin 31 October 2021 23:48


# TERMINAL GOODIES w/o gui
sudo apt install software-properties-common apt-transport-https wget -y
sudo apt remove vim -y          # remove old vim
sudo apt install git -y
sudo apt install zsh -y
sudo apt install tmux -y         # best solution for spliting terminal screen                      
sudo apt install curl -y
sudo apt install neovim -y       # neovim better than vim
sudo apt install subversion -y   # for cloning specific folder of repos

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# fun stuff
sudo apt install screenfetch -y  # for info
sudo apt install cmatrix -y      # for fun 🤟

### APPLICATIONS ###
# -- no configuration needed apps w/ gui
# sudo apt install discord                # for meetings
# sudo apt install zoom                   # for facetime
sudo apt install kdenlive -y               # video editing 📼
# sudo apt install breeze                 # for having dark theme in kdenlive -> optional
sudo apt install sqlitebrowser -y         # for sql dbs
sudo apt install geary -y                  # emails 📬
sudo apt install obs-studio -y             # screen recording 💻


# -- CONFIGURATION NEEDED APPS
# -- NON-GUI APPS
# --- gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update -y
sudo apt install gh -y

# --- touchegg: for trackpad shortcuts
sudo add-apt-repository ppa:touchegg/stable -y
sudo apt install touchegg -y

# -- GUI APPS
# --- vscode: 1st code editor
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y

# --- sublime text: 2nd code editor
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install sublime-text -y


# --- spotify: for music
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y && sudo apt-get install spotify-client -y

# -- songrec: shazam client for linux
sudo apt-add-repository ppa:marin-m/songrec -y -u
sudo apt install songrec -y
songrec



# TERMINAL APPS RUN

# -- github cli run/login -> better with manually

# zsh extention
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Manual Needed Apps: Discord, Zoom, Mega.nz"

# github configuration
git config --global user.email "ybgirgin3@gmail.com"
git config --global user.name "ybgirgin3"

# -- oh my zsh run
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
