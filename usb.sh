#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm gptfdisk exfatprogs

sudo mkdir -p /mnt/usb
