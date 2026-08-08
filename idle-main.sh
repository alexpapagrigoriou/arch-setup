#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/sleep-operation.conf" >/dev/null <<'EOF'
[Login]
SleepOperation=suspend
EOF

cat >"$HOME/.config/i3/idle.conf" <<'EOF'
SCREEN_OFF_TIMEOUT=600
SLEEP_TIMEOUT=7200
EOF

cat >"$HOME/.config/i3/idle.sh" <<'EOF'
#!/bin/bash

source ~/.config/i3/idle.conf

xidlehook \
    --detect-sleep \
    --not-when-audio \
    --timer "$SCREEN_OFF_TIMEOUT" ~/.config/i3/screen-off.sh '' \
    --timer "$SLEEP_TIMEOUT" 'systemctl sleep' ''
EOF
chmod +x "$HOME/.config/i3/idle.sh"
