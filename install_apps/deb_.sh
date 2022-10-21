## GOODIES INSTALLATION ##
# For Automating Apps and Terminal Utilities
# No DE dependency
# Ubuntu
## Yusuf Berkay Girgin 31 October 2021 23:48

# aur for ubuntu
sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)"

# brew install 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# *** TERMINAL GOODIES w/o gui
sudo apt install software-properties-common apt-transport-https wget -y
sudo apt remove vim -y          # remove old vim
sudo apt install git -y
sudo apt install zsh -y
sudo apt install tmux -y         # best solution for spliting terminal screen                      
sudo apt install curl -y
# sudo apt install neovim -y       # neovim better than vim
sudo apt install subversion -y   # for cloning specific folder of repos

pacstall -I discord
pacstall -I notion-app-deb
pacstall -I ripgrep
pacstall -I lazygit

### APPLICATIONS ###
# -- no configuration needed apps w/ gui
# sudo apt install discord                # for meetings
# sudo apt install zoom                   # for facetime
# sudo apt install kdenlive -y               # video editing 📼
# sudo apt install breeze                 # for having dark theme in kdenlive -> optional
sudo apt install sqlitebrowser -y         # for sql dbs
# sudo apt install geary -y                  # emails 📬 # no need in kde
sudo apt install obs-studio -y             # screen recording 💻

# --- fnm: light node version manager
curl -fsSL https://fnm.vercel.app/install | bash

# -- GUI APPS
# --- google
pacstall -I google-chrome-deb

# --- vscode: 1st code editor
pacstall -I vscode-deb

# --- sublime text: 2nd code editor
pacstall -I sublime-text-deb

# --- songrec: shazam client for linux
sudo apt-add-repository ppa:marin-m/songrec -y -u
sudo apt install songrec -y

# -- github cli run/login -> better with manually
pacstall -I github-cli-deb

# install ohmyzsh and needed extensions
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


echo "Manual Needed Apps: Discord, Zoom, Mega.nz, xampp, miniconda for python 3.9"
echo """
manuel olarak çalıştırılması gereken komutlar:

  # zsh extention
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # brew zsh configuration
  # add these lines to .zshrc
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  # most used alias
  alias yzt="ssh -Y <ip>"
  alias paradir="cd /home/berkay/Documents/"
  alias vim="/home/berkay/.local/bin/lvim"
  alias p="python3"
"""
