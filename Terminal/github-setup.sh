#!/bin/bash

# Renk tanımlamaları
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}İki farklı GitHub hesabı için kurulum yapılıyor...${NC}"

# Ana dizinleri oluşturma - Documents/Work ve Documents/Personal olarak ayarlandı
WORK_DIR="$HOME/Documents/Work"
PERSONAL_DIR="$HOME/Documents/Personal"

echo -e "${YELLOW}Ana dizinler oluşturuluyor...${NC}"
mkdir -p "$WORK_DIR" "$PERSONAL_DIR"

# Kullanıcı bilgilerini alma
echo -e "${GREEN}İş hesabı için bilgiler:${NC}"
read -p "İş e-postası: " work_email
read -p "İş kullanıcı adı: " work_name
read -p "İş GitHub organizasyon veya kullanıcı adı: " work_github

echo -e "${GREEN}Kişisel hesap için bilgiler:${NC}"
read -p "Kişisel e-posta: " personal_email
read -p "Kişisel kullanıcı adı: " personal_name
read -p "Kişisel GitHub kullanıcı adı: " personal_github

# SSH dizininin varlığını kontrol etme
if [ ! -d "$HOME/.ssh" ]; then
    echo -e "${YELLOW}~/.ssh dizini oluşturuluyor...${NC}"
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
fi

# SSH anahtarlarını oluşturma
echo -e "${YELLOW}SSH anahtarları oluşturuluyor...${NC}"

# İş anahtarı
if [ ! -f "$HOME/.ssh/id_work" ]; then
    echo -e "${GREEN}İş SSH anahtarı oluşturuluyor...${NC}"
    ssh-keygen -t ed25519 -C "$work_email" -f ~/.ssh/id_work -N ""
else
    echo -e "${YELLOW}İş SSH anahtarı zaten mevcut. Yeni oluşturulmayacak.${NC}"
fi

# Kişisel anahtar
if [ ! -f "$HOME/.ssh/id_personal" ]; then
    echo -e "${GREEN}Kişisel SSH anahtarı oluşturuluyor...${NC}"
    ssh-keygen -t ed25519 -C "$personal_email" -f ~/.ssh/id_personal -N ""
else
    echo -e "${YELLOW}Kişisel SSH anahtarı zaten mevcut. Yeni oluşturulmayacak.${NC}"
fi

# SSH konfigürasyonu oluşturma
echo -e "${YELLOW}SSH konfigürasyonu oluşturuluyor...${NC}"
cat > ~/.ssh/config << EOF
# İş GitHub hesabı
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_work
    IdentitiesOnly yes

# Kişisel GitHub hesabı
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_personal
    IdentitiesOnly yes
EOF

chmod 600 ~/.ssh/config

# Git konfigürasyonlarını ayarlama
echo -e "${YELLOW}Git konfigürasyonları ayarlanıyor...${NC}"

# Ana gitconfig dosyası
cat > ~/.gitconfig << EOF
[includeIf "gitdir:$WORK_DIR/"]
    path = $WORK_DIR/.gitconfig
[includeIf "gitdir:$PERSONAL_DIR/"]
    path = $PERSONAL_DIR/.gitconfig
EOF

# İş gitconfig
cat > "$WORK_DIR/.gitconfig" << EOF
[user]
    name = $work_name
    email = $work_email
[url "github-work:"]
    insteadOf = git@github.com:
EOF

# Kişisel gitconfig
cat > "$PERSONAL_DIR/.gitconfig" << EOF
[user]
    name = $personal_name
    email = $personal_email
[url "github-personal:"]
    insteadOf = git@github.com:
EOF

# GitHub CLI için yapılandırma
echo -e "${YELLOW}GitHub CLI yapılandırması ayarlanıyor...${NC}"

# GitHub CLI yapılandırma dizinleri
mkdir -p "$WORK_DIR/.config/gh"
mkdir -p "$PERSONAL_DIR/.config/gh"

# Shell tipi kontrolü
SHELL_FILE=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_FILE="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_FILE="$HOME/.bashrc"
else
    echo -e "${RED}Ne .bashrc ne de .zshrc bulundu, aliaslar manuel olarak eklenmelidir.${NC}"
    SHELL_FILE="/tmp/shell_aliases.txt"
fi

# GitHub CLI aliasları
echo -e "${YELLOW}Shell yapılandırmasına GitHub CLI aliasları ekleniyor...${NC}"

# Eğer alias'lar dosyada yoksa ekleyin
if ! grep -q "work-gh=" "$SHELL_FILE"; then
    echo "" >> "$SHELL_FILE"
    echo "# GitHub CLI için aliases" >> "$SHELL_FILE"
    echo "alias work-gh='cd $WORK_DIR && GH_CONFIG_DIR=$WORK_DIR/.config/gh gh'" >> "$SHELL_FILE"
    echo "alias personal-gh='cd $PERSONAL_DIR && GH_CONFIG_DIR=$PERSONAL_DIR/.config/gh gh'" >> "$SHELL_FILE"
    echo -e "${GREEN}GitHub CLI aliasları eklendi.${NC}"
else
    echo -e "${YELLOW}GitHub CLI aliasları zaten mevcut.${NC}"
fi

# Kurulum sonrası bilgiler
echo -e "${GREEN}Kurulum tamamlandı!${NC}"
echo -e "${BLUE}SSH public anahtarlarınızı GitHub hesaplarınıza eklemeniz gerekiyor:${NC}"
echo -e "${YELLOW}İş hesabı için: ${NC}cat ~/.ssh/id_work.pub"
echo -e "${YELLOW}Kişisel hesap için: ${NC}cat ~/.ssh/id_personal.pub"

echo -e "\n${BLUE}Test bağlantıları:${NC}"
echo -e "${YELLOW}İş hesabı için: ${NC}ssh -T github-work"
echo -e "${YELLOW}Kişisel hesap için: ${NC}ssh -T github-personal"

echo -e "\n${BLUE}GitHub CLI Kurulumu:${NC}"
echo -e "${YELLOW}İş hesabı için: ${NC}cd $WORK_DIR && GH_CONFIG_DIR=$WORK_DIR/.config/gh gh auth login -h github.com -p ssh --ssh-key ~/.ssh/id_work"
echo -e "${YELLOW}Kişisel hesap için: ${NC}cd $PERSONAL_DIR && GH_CONFIG_DIR=$PERSONAL_DIR/.config/gh gh auth login -h github.com -p ssh --ssh-key ~/.ssh/id_personal"

echo -e "\n${BLUE}GitHub CLI Kullanım örnekleri:${NC}"
echo -e "${YELLOW}İş projeleri için: ${NC}work-gh repo clone $work_github/proje-adi"
echo -e "${YELLOW}Kişisel projeler için: ${NC}personal-gh repo clone $personal_github/proje-adi"

echo -e "\n${GREEN}Artık $WORK_DIR dizininde çalışırken iş hesabınızı, $PERSONAL_DIR dizininde çalışırken kişisel hesabınızı kullanacaksınız.${NC}"
echo -e "${YELLOW}Shell yapılandırmasını yüklemek için: source $SHELL_FILE${NC}"
