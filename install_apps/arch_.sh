# manjaro
# Yusuf Berkay Girgin 16 Jan 2022 10:36

# use yay instead
# configure yay
# git clone https://aur.archlinux.org/yay-git.git
# sudo chown -R berkay:berkay ./yay-git
# cd yay-git && makepkg -si

sudo pacman -Rsn vim
# no need to zsh it's already installed
sudo pacman -Syy git wget curl neovim subversion tmux screenfetch obs-studio discord songrec zsh github-cli

# applications
yay -Sy google-chrome
yay -Sy visual-studio-code-bin
yay -Sy zoom
yay -Sy miniconda
yay -Sy slack-desktop

# fonts
yay -Sy ttf-joypixels
yay -Sy nerd-fonts-fantasque-sans-mono

# install astrovim
mkdir -p ~/.config/nvim
git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
nvim +PackerSync


echo "Manual Needed Apps: Mega.nz, miniconda for python 3.9"
echo """
manuel olarak çalıştırılması gereken komutlar:
  # -- oh my zsh run
  # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # zsh extention
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fnm install <lts-version-node>
  gh auth login
  font: ttf-iosevka-11.2.6.zip
  move local.conf to /etc/fonts/local.conf
  !!!! GO TO http://neovimcraft.com/plugin/kabinspace/AstroVim/index.html to completely configure Astrovim
  

"""
