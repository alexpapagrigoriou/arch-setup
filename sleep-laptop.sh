#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/idle-action.conf" >/dev/null <<'EOF'
[Login]
IdleAction=suspend-then-hibernate
IdleActionSec=30min
EOF

sudo tee "/etc/systemd/logind.conf.d/lid-switch.conf" >/dev/null <<'EOF'
[Login]
HandleLidSwitch=suspend-then-hibernate
HandleLidSwitchExternalPower=suspend-then-hibernate
HandleLidSwitchDocked=ignore
EOF

sudo mkdir -p /etc/systemd/sleep.conf.d
sudo tee "/etc/systemd/sleep.conf.d/hibernate-delay.conf" >/dev/null <<'EOF'
[Sleep]
HibernateDelaySec=90min
EOF
