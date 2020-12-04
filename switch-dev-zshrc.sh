#!/bin/sh

set -e

# If backup exist we are developing the new so restore
# Else backup and load new to develop
if [ -f ~/.zshrc.old ]; then
    echo "ORIGINAL | Backup file found. Restore old"
    # Restore backup to original
    mv -f ~/.zshrc.old ~/.zshrc
else
    echo "DEV | Backup and load new zshrc to develop"
    # Move old to backup
    mv ~/.zshrc ~/.zshrc.old

    # Link develop
    ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
fi
