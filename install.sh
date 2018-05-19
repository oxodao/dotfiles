#!/bin/bash
rm ~/.files
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/dunst

ln -s $(pwd)/files          ~/.files
ln -s $(pwd)/i3/config      ~/.config/i3/config
ln -s $(pwd)/i3/i3blocks    ~/.config/i3blocks/config
ln -s $(pwd)/i3/dunstrc     ~/.config/dunst/dunstrc
ln -s $(pwd)/git/config     ~/.gitconfig
ln -s $(pwd)/git/ignore     ~/.gitignore
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
