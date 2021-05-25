#!/bin/sh

STOW_PACKAGES='zsh tmux nvim git ideavim'
echo 'Show all:' $STOW_PACKAGES
stow -v $STOW_PACKAGES
