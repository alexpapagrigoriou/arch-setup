#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/idle-action.conf" >/dev/null <<'EOF'
[Login]
IdleAction=suspend
IdleActionSec=2h
EOF
