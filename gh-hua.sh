#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm git git-lfs
git lfs install

cat >"$HOME/.gitconfig" <<EOF
[user]
	name = Alexandros Papagrigoriou
	email = apapagrigoriou17@gmail.com
[init]
	defaultBranch = main
[push]
	autoSetupRemote = true
[core]
	autocrlf = input
[includeIf "gitdir:~/hua/"]
    path = ~/.gitconfig-hua
EOF

cat >"$HOME/.gitconfig-hua" <<EOF
[user]
    name = it2023054
    email = it2023054@hua.gr
EOF

mkdir -p "$HOME/hua"
