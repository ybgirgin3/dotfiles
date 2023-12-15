# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/berkay/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install apps with no gui
brew install btop
brew install wget
brew install node
brew install gh
brew install neovim
brew install tmux
brew install curl
brew install neofetch
brew install karabiner-elements

# install apps with gui
brew install fork
brew install orbstack
brew install iterm2
brew install alacritty
brew install obs
brew install vlc
brew install visual-studio-code
brew install google-chrome
brew install notion
brew install postman
brew install apidog
brew install opera
brew install zoom


# manual installation requiring apps
echo "karabiner-elements settings is in: https://karabiner-elements.pqrs.org/docs/getting-started/installation/#install-karabiner-elements"
echo "OneMenu => alternative to rectangle"
echo "Mos => mouse scroll behaviour change"
echo "pycharm and webstore => i have licence of intellij"
echo "Arc Browser => "
