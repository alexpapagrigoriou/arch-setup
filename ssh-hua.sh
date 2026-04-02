#!/bin/bash

set -e

KEY1_EMAIL="apapagrigoriou17@gmail.com"
KEY1_PATH="$HOME/.ssh/id_ed25519"

KEY2_EMAIL="it2023054@hua.gr"
KEY2_PATH="$HOME/.ssh/id_ed25519_hua"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

for KEY_PATH in "$KEY1_PATH" "$KEY2_PATH"; do
    if [ -f "$KEY_PATH" ]; then
        echo "SSH key already exists at $KEY_PATH, skipping..."
    else
        if [ "$KEY_PATH" = "$KEY1_PATH" ]; then
            EMAIL="$KEY1_EMAIL"
        else
            EMAIL="$KEY2_EMAIL"
        fi
        ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
    fi
done

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
    eval "$(ssh-agent -s)"
fi

ssh-add "$KEY1_PATH"
ssh-add "$KEY2_PATH"

mkdir -p "$HOME/.ssh"
cat >"$HOME/.ssh/config" <<'EOF'
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    AddKeysToAgent yes

Host github-hua.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_hua
    AddKeysToAgent yes
EOF
chmod 600 "$HOME/.ssh/config"
