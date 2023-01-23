# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/berkay/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install apps with no gui
brew install btop
brew install wget
brew install node
brew install gh
brew install neovim
brew install tmux
brew install curl



# install apps with gui
brew install unnaturalscrollwheels
brew install rectangle
brew install telegram-desktop
brew install iterm2
brew install obs
brew install vlc
brew install visual-studio-code
brew install google-chrome
brew install notion
brew install postman
brew install opera
brew install zoom




echo """
# download miniconda from anaconda site and install it without sudo 🥲
# install api-dog as a alternative to postman is really good


# configure github-cli
  gh auth login


# install powerline10k
brew install romkatv/powerlevel10k/powerlevel10k\
   echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

"""

