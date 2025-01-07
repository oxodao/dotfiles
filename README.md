# Installation

```sh
touch ~/.memo.md
touch ~/.zshrc.custom

ln -s $PWD/config ~/.config
ln -s $PWD/resources ~/.Xresources # Not sure if still required @TODO
ln -s $PWD/resources.`hostname` ~/.Xresources.`hostname` # Not sure if still required @TODO
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/gitconfig ~/.gitconfig

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
yay -Sy rofi rofimoji rofi-calc xclip xsel xdotool exa direnv dunst alacritty lm_sensors inetutils scrot i3lock playerctl metaprint-bin bat visidata
```

@TODO: Add in ansible-arch-setup: bat, visidata

## Other things that I can't include properly

- Spicetify with theme Phosphoria
- BetterDiscord
