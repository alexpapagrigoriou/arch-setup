#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/sleep-operation.conf" >/dev/null <<'EOF'
[Login]
SleepOperation=suspend-then-hibernate suspend
EOF

sudo tee "/etc/systemd/logind.conf.d/lid-switch.conf" >/dev/null <<'EOF'
[Login]
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
EOF

sudo mkdir -p /etc/systemd/sleep.conf.d
sudo tee "/etc/systemd/sleep.conf.d/hibernate-delay.conf" >/dev/null <<'EOF'
[Sleep]
HibernateDelaySec=90min
EOF

sudo mkdir -p /etc/UPower/UPower.conf.d
sudo tee "/etc/UPower/UPower.conf.d/01-critical-power-action.conf" >/dev/null <<'EOF'
[UPower]
CriticalPowerAction=Hibernate
EOF

mkdir -p "$HOME/.config/systemd/user"
cat >"$HOME/.config/systemd/user/xidlehook.service" <<EOF
[Unit]
Description=Automatic Screen Locker

[Service]
Type=simple
Environment=DISPLAY=:0
ExecStart=/usr/bin/xidlehook --detect-sleep --not-when-audio --timer 600 ~/.local/bin/screen-off '' --timer 1800 'systemctl sleep' ''

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now xidlehook.service
