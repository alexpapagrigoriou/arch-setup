#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm keyd

sudo tee "/etc/keyd/default.conf" >/dev/null <<'EOF'
[ids]
*

[main]
capslock = leftcontrol
leftcontrol = capslock
backslash = backspace
backspace = backslash
EOF

sudo systemctl enable --now keyd
sudo systemctl restart keyd
