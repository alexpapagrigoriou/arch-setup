#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm nvidia-open nvidia-utils
