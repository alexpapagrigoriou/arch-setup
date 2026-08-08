#!/bin/bash

set -e

sudo mkdir -p /etc/systemd/logind.conf.d
sudo tee "/etc/systemd/logind.conf.d/sleep-operation.conf" >/dev/null <<'EOF'
[Login]
SleepOperation=suspend-then-hibernate suspend
EOF

sudo tee "/etc/systemd/logind.conf.d/lid-switch.conf" >/dev/null <<'EOF'
[Login]
HandleLidSwitch=sleep
HandleLidSwitchExternalPower=sleep
HandleLidSwitchDocked=ignore
EOF

sudo mkdir -p /etc/systemd/sleep.conf.d
sudo tee "/etc/systemd/sleep.conf.d/hibernate-delay.conf" >/dev/null <<'EOF'
[Sleep]
HibernateDelaySec=90min
EOF

cat >"$HOME/.config/i3/idle.conf" <<'EOF'
SCREEN_OFF_TIMEOUT=600
SLEEP_TIMEOUT=1800
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

sudo mkdir -p /etc/UPower/UPower.conf.d
sudo tee "/etc/UPower/UPower.conf.d/01-critical-power-action.conf" >/dev/null <<'EOF'
[UPower]
CriticalPowerAction=Hibernate
EOF
