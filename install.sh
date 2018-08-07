#!/bin/bash
echo "Your current folder is $(pwd). Please be sure the folder that won't move."
echo "Please be sure you have installed ALL dependencies required (File dependencies.md)"

while true; do
    read -p "Do you wish to install this program for desktop or laptop (D/L/Q)" yn
    case $yn in
        [Dd]* ) export MACHINE="desk"; break;;
        [Ll]* ) export MACHINE="laptop"; break;;
        [Qq]* ) exit;;
        * ) echo "Please answer D (desktop), L (laptop) or Q (Quit).";;
    esac
done

echo "You're installing machine named $MACHINE."

echo "Moving old symlink & creating directories"
echo "If there are errors here, don't worry. You may not have old configs"
rm ~/.files
mv ~/.config/termite/config ~/.config/termite/config_bak
mv ~/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf_
mv ~/.tmux.conf ~/.tmux.conf_bak
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim_bak
mv ~/.gitignore ~/.gitignore_bak
mv ~/.gitconfig ~/.gitconfig_bak
mv ~/.Xresources ~/.Xresources_bak

mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/dunst
mkdir -p ~/.config/termite
mkdir -p ~/.config/mpv

echo "From now on, there should no longer have errors"
echo "Creating symlink for main folder"
ln -s $(pwd)/files        ~/.files

echo "Linking machine specific stuff"
mkdir $(pwd)/files/scripts/machine
ln -s $(pwd)/files/scripts/ip.$MACHINE.py $(pwd)/files/scripts/machine/ip.py

echo "Installing zsh"
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s $(pwd)/zsh/theme ~/.oh-my-zsh/themes/mattboll.zsh-theme
ln -s $(pwd)/zsh/zshrc ~/.zshrc

echo "Installing i3-gaps"
ln -s $(pwd)/i3/config    ~/.config/i3/config
ln -s $(pwd)/i3/i3blocks.$MACHINE  ~/.config/i3blocks/config
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

echo "Installing Tmux"
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf

echo "Installing mpv"
ln -s $(pwd)/mpv/mpv.conf ~/.config/mpv/mpv.conf

echo "Installing Neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $(pwd)/vim/init.vim ~/.config/nvim/init.vim
nvim +PlugInstall +qall
