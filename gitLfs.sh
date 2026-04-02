#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm git git-lfs
git lfs install
