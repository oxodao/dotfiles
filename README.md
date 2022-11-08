# Installation

N.B. I am using my [metaprint](https://github.com/oxodao/metaprint) software so it is required for this config to work. Though since there is no packages yet, I do not include it in the last section.
```sh
touch ~/.memo
touch ~/.zshrc.custom
mkdir -p ~/.config ~/.config/alacritty ~/.config/nvim
ln -s $PWD/resources ~/.Xresources
ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $PWD/resources.`hostname` ~/.Xresources.`hostname`
ln -s $PWD/termite ~/.config/termite
ln -s $PWD/scripts ~/.config/scripts
ln -s $PWD/wall.png ~/.config/wall.png
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/zsh ~/.config/zsh
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/tmux ~/.config/tmux
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/mpv ~/.config/mpv
ln -s $PWD/i3 ~/.config/i3
ln -s $PWD/rofi ~/.config/rofi
ln -s $PWD/dunst ~/.config/dunst
ln -s $PWD/metaprint ~/.config/metaprint
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/gitignore ~/.gitignore
ln -s $PWD/user-dirs.dirs ~/.config/user-dirs.dirs
ln -s $PWD/systemd_user ~/.config/systemd
mkdir -p ~/Documents ~/Images ~/Musiques ~/Videos ~/Téléchargements
xdg-user-dirs-update
systemctl enable --now --user ssh-agent
```

# Customizations
This setup requires a ~/.zshrc.custom that lets you customize the setup for the current device

This also requires a ~/.config/i3/custom.`hostname`.conf file (can be empty).

## Git
Change the email per machine (i.e. work machine vs home machine)
`~/.zshrc.custom`
```sh
export GIT_AUTHOR_NAME=FIRSTNAME LASTNAME
export GIT_AUTHOR_EMAIL=my@email.fr
export GIT_COMMITTER_NAME=FIRSTNAME LASTNAME
export GIT_COMMITTER_EMAIL=my@email.fr
```

## Packages required

```sh
yay -Sy rofi rofimoji rofi-calc xclip xsel xdotool exa direnv dunst alacritty lm_sensors inetutils scrot i3lock playerctl metaprint
```

@TODO: Add in ansible-arch-setup: bat, visidata

## Other things that I can't include properly

- Spicetify with theme Phosphoria
- BetterDiscord
