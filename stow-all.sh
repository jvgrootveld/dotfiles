#!/bin/sh

STOW_PACKAGES='zsh tmux nvim git ideavim alacritty bin kitty'
echo 'Show all:' $STOW_PACKAGES
stow -v $STOW_PACKAGES
