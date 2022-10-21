# manjaro
# Yusuf Berkay Girgin 16 Jan 2022 10:36

# use yay instead
# configure yay
# git clone https://aur.archlinux.org/yay-git.git
# sudo chown -R berkay:berkay ./yay-git
# cd yay-git && makepkg -si

sudo pacman -S base-devel
sudo pacman -Rsn vim
# no need to zsh it's already installed
sudo pacman -Syy git wget curl neovim subversion tmux screenfetch obs-studio discord songrec github-cli lazygit

# yay comes with Endeavours OS but not with the manjaro
sudo pacman -Sy yay

# applications
yay -Sy google-chrome
yay -Sy visual-studio-code-bin
yay -Sy kitty
yay -Sy notion-app
yay -Sy btop
yay -Sy nvtop  # it will only run if you have nvidia gpu and your drivers are installed
#yay -Sy zoom
#yay -Sy miniconda
#yay -Sy slack-desktop

# fonts
yay -Sy ttf-joypixels
yay -Sy nerd-fonts-fantasque-sans-mono
#yay -Sy ttf-comic-mono-git

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
 

echo "Manual Needed Apps: Mega.nz, miniconda"
echo """
manuel olarak çalıştırılması gereken komutlar:
  # zsh extention
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  zsh theme /Terminal/zsh/daviasmara.zshtheme

  move local.conf to /etc/fonts/local.conf

  # most used alias
  alias yzt="ssh -Y <ip>"
  alias paradir="cd /home/berkay/Documents/"
  alias vim="/home/berkay/.local/bin/lvim"
  alias p="python3"

"""
