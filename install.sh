#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(fzf starship ripgrep)

echo ":: Install: ${PACKAGES[*]}"

sudo pacman -Syu --needed --noconfirm "${PACKAGES[@]}"


