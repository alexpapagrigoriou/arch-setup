#!/bin/bash

set -e

sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

sudo pacman -S --noconfirm discord code
yay -S --noconfirm intellij-idea-community-edition
#yay -S --noconfirm intellij-idea-ultimate-edition

#yay -S --noconfirm grub-customizer
