#!/usr/bin/env zsh

STOW_FOLDERS="nvim,zsh,alacritty,tmux,scripts,colors"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Installing configuration for '$folder'"
    stow $folder --target="$HOME/"
done
