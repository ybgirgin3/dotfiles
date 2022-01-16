# manjaro
# Yusuf Berkay Girgin 16 Jan 2022 10:36

# use yay instead
# configure yay
git clone https://aur.archlinux.org/yay-git.git
sudo chown -R berkay:berkay ./yay-git
cd yay-git && makepkg -si

sudo pacman -Rsn vim
sudo pacman -Syy git
# no need to zsh it's already installed
sudo pacman -Syy curl neovim subversion tmux screenfetch obs-studio

# install vscode
yay -Sy google-chrome
yay -Sy visual-studio-code-bin


echo "Manual Needed Apps: Discord, Zoom, Mega.nz, xampp, miniconda for python 3.9"
echo """
manuel olarak çalıştırılması gereken komutlar:
  # -- oh my zsh run
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # zsh extention
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fnm install <lts-version-node>
  gh auth login
"""
