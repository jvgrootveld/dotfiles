#!/bin/sh

STOW_PACKAGES='zsh tmux nvim ideavim alacritty kitty'
echo 'Stow all:' $STOW_PACKAGES
stow -v $STOW_PACKAGES
