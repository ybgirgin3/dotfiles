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
brew install neofetch


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

