#!/bin/bash

set -e

ORIG_DIR=$(pwd)

TMP_DIR=$(mktemp -d)

cleanup() {
    cd "$ORIG_DIR"
    [[ -d "$TMP_DIR" ]] && rm -rf "$TMP_DIR"
}
trap cleanup EXIT

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm git base-devel

cd "$TMP_DIR"

git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si --noconfirm

yay -Syu --noconfirm
