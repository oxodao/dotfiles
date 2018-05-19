#!/bin/bash
echo "Your current folder is $(pwd). Please be sure the folder that won't move."

echo "Removing old symlink & creating directories"
rm ~/.files
mv ~/.config/termite/config ~/.config/termite/config_bak
mv ~/.tmux.conf ~/.tmux.conf_bak
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/dunst
mkdir -p ~/.config/termite

echo "Creating symlink for main folder"
ln -s $(pwd)/files        ~/.files

echo "Installing zsh"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $(pwd)/zsh/theme ~/.oh-my-zsh/themes/mattboll.zsh-theme
ln -s $(pwd)/zsh/zshrc ~/.zshrc

echo "Installing i3-gaps"
ln -s $(pwd)/i3/config    ~/.config/i3/config
ln -s $(pwd)/i3/i3blocks  ~/.config/i3blocks/config
ln -s $(pwd)/i3/dunstrc   ~/.config/dunst/dunstrc
ln -s $(pwd)/i3/resources ~/.Xresources

echo "Installing termite theme"
ln -s $(pwd)/termite/config ~/.config/termite/config

echo "Installing firefox"
FX_PATH=$(cat ~/.mozilla/firefox/profiles.ini | grep 'Path=' | sed s/^Path=//)
CHR_FLD="$HOME/.mozilla/firefox/$FX_PATH/chrome"
mkdir -p $CHR_FLD
ln -s $(pwd)/firefox/userchrome $CHR_FLD/userChrome.css

echo "Installing Git config"
ln -s $(pwd)/git/config   ~/.gitconfig
ln -s $(pwd)/git/ignore   ~/.gitignore

echo "Installing tmux"
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
