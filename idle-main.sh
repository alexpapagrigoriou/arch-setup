#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/sleep-operation.conf" >/dev/null <<'EOF'
[Login]
SleepOperation=suspend
EOF

mkdir -p "$HOME/.config/systemd/user"
cat >"$HOME/.config/systemd/user/xidlehook.service" <<EOF
[Unit]
Description=Automatic Screen Locker

[Service]
Type=simple
Environment=DISPLAY=:0
ExecStart=/usr/bin/xidlehook --detect-sleep --not-when-audio --timer 600 ~/.local/bin/screen-off '' --timer 7200 'systemctl sleep' ''

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now xidlehook.service
