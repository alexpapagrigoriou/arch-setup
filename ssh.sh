#!/bin/bash

set -e

KEY_EMAIL="apapagrigoriou17@gmail.com"
KEY_PATH="$HOME/.ssh/id_ed25519"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [ -f "$KEY_PATH" ]; then
    echo "SSH key already exists at $KEY_PATH, skipping..."
else
    ssh-keygen -t ed25519 -C "$KEY_EMAIL" -f "$KEY_PATH" -N ""
fi

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
    eval "$(ssh-agent -s)"
fi

ssh-add "$KEY_PATH"

mkdir -p "$HOME/.ssh"
cat >"$HOME/.ssh/config" <<'EOF'
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    AddKeysToAgent yes

Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    AddKeysToAgent yes
EOF
chmod 600 "$HOME/.ssh/config"

echo ""
echo "Public SSH key:"
cat "${KEY_PATH}.pub"
