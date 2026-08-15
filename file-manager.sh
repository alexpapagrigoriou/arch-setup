#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm thunar tumbler gvfs gvfs-mtp gvfs-smb udisks2 file-roller unzip p7zip unrar
