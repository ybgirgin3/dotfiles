#!/bin/bash

echo "=== GitHub Kişisel Hesap Ayarlayıcı ==="
echo

# === Kullanıcı Bilgileri Al ===
read -p "Kişisel GitHub e-mail adresi: " PERSONAL_EMAIL
read -p "Kişisel GitHub kullanıcı adı: " PERSONAL_USER
read -p "Kişisel projeler klasörü (tam yol, ör: /Users/kullanici/projects/personal): " PERSONAL_DIR
read -p "Kişisel SSH key ismi (boş bırakılırsa id_ed25519_personal): " PERSONAL_KEY_NAME
PERSONAL_KEY_NAME=${PERSONAL_KEY_NAME:-id_ed25519_personal}

echo
echo "🔐 SSH anahtarı oluşturuluyor (kişisel)..."

# === SSH Anahtarını Oluştur ===
ssh-keygen -t ed25519 -C "$PERSONAL_EMAIL" -f "$HOME/.ssh/$PERSONAL_KEY_NAME"

echo
echo "🔧 SSH config dosyası güncelleniyor..."

# === SSH Config Güncelle ===
SSH_CONFIG="$HOME/.ssh/config"
touch $SSH_CONFIG

# Önce eski github-personal varsa sil
sed -i '' '/Host github-personal/,+5d' $SSH_CONFIG 2>/dev/null

# Personal config ekle
echo -e "\nHost github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/$PERSONAL_KEY_NAME
    IdentitiesOnly yes" >> $SSH_CONFIG

echo
echo "📎 Public key'in GitHub hesabına ekle (Settings > SSH and GPG Keys):"
echo "=== Personal Public Key ==="
cat "$HOME/.ssh/$PERSONAL_KEY_NAME.pub"

# === Git config ayarları ===
echo
echo "⚙️ Git config ayarları yapılıyor..."

cd "$PERSONAL_DIR" && git config user.name "$PERSONAL_USER" && git config user.email "$PERSONAL_EMAIL"

echo
echo "✅ Kurulum tamamlandı."
echo "📁 Personal repo klonlarken şu şekilde kullan:"
echo "git clone git@github-personal:$PERSONAL_USER/REPO_ADI.git"
echo
echo "🧪 Test bağlantısı için:"
echo "ssh -T git@github-personal"

