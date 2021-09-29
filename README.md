# Installation

N.B. I am using my [metaprint](https://github.com/oxodao/metaprint) software so it is required for this config to work. Though since there is no packages yet, I do not include it in the last section.
```sh
touch ~/.memo
touch ~/.zshrc.custom
mkdir -p ~/.config
ln -s $PWD/resources ~/.Xresources
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

// I know termite is obselete, I'm in the process of switching to Alacritty. Come back in a few years.
```sh
yay -Sy rofi rofimoji rofi-calc xclip xsel xdotool exa direnv dunst termite lm_sensors inetutils scrot i3lock
```

## Other things that I can't include properly

- i3-gaps requires to be built by hand on the "include" branch
- Spicetify with theme Phosphoria
- BetterDiscord
