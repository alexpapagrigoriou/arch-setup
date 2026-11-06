#!/bin/bash

set -e

sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

sudo pacman -S --noconfirm virtualbox virtualbox-host-dkms dkms linux-headers
yay -S --noconfirm vagrant

sudo dkms autoinstall
sudo modprobe vboxdrv
