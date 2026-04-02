#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm docker docker-compose

sudo usermod -aG docker "$USER"

sudo systemctl enable --now docker
