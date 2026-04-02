#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm wireguard-tools

cat >"$HOME/.vpn-up.sh" <<'EOF'
#!/bin/bash

sudo wg-quick up main
ssh it2023054@cli.ditapps.hua.gr
EOF
chmod +x "$HOME/.vpn-up.sh"

cat >"$HOME/.vpn-down.sh" <<'EOF'
#!/bin/bash

sudo wg-quick down vpn
EOF
chmod +x "$HOME/.vpn-down.sh"
