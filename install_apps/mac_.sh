# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/berkay/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install apps with no gui
brew install btop
brew install wget
brew install node
brew install gh


# install apps with gui
brew install obs
brew install vlc
brew install --cask visual-studio-code
brew install google-chrome



echo """
# download miniconda from anaconda site and install it without sudo 🥲


# configure github-cli
  gh auth login


# install powerline10k
brew install romkatv/powerlevel10k/powerlevel10k\
   echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

"""

