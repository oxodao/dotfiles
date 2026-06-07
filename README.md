# Installation

```sh
touch ~/.memo.md
touch ~/.zshrc.custom

ln -s $PWD/config ~/.config
ln -s $PWD/resources ~/.Xresources # [X11 ONLY] Not sure if still required @TODO
ln -s $PWD/resources.`hostname` ~/.Xresources.`hostname` # [X11 ONLY] Not sure if still required @TODO
ln -s $PWD/zshrc ~/.zshrc # Remove zshrc after installing zsh and before running this command
ln -s $PWD/gitconfig ~/.gitconfig

mkdir -p ~/Documents ~/Images ~/Musiques ~/Videos ~/Téléchargements
xdg-user-dirs-update
systemctl enable --now --user ssh-agent
```

# Customizations

This setup requires a ~/.zshrc.custom that lets you customize the setup for the current device

[X11]: This also requires a ~/.config/i3/custom.`hostname`.conf file (can be empty).

[WL]: This also requires a ~/.config/hypr/hyprland/host/`hostname`.conf file (can be empty).

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

@TODO: List all packages (there are only a few here i miss most of the stuff)

- [rofi-calc](https://github.com/svenstaro/rofi-calc)
- [rofi-emoji](https://github.com/Mange/rofi-emoji)
- [metaprint](https://github.com/oxodao/metaprint)

```sh
$ sudo apt install rofi eza direnv dunst alacritty git-delta
```

## Wayland

I despise wayland but I need to move on from my beloved setup. We're still a long way before I'm at a daily-driveable setup.

I will have to make quite a few glue scripts to keep my muscular memory. Among the feature I miss:

- Hyprland tabs are absolutely noway near as good as i3's
- Layout sucks, I want manual layout. Everything should open vertically unless I explicitely tells it to go horizontal
- Moving window doesn't feel the same as in i3
- Proper keyring auto-unlock
- Some window used to open silently in another WS whereas here it always focus it, I need to find which one and add the silent modifier
- Not checked anything about popup windows (e.g. thunar copy should be floating automatically)
- Every fucking thing in hyprland is toggle (floating, pin, ...). I hate that and I need to have a way to be manual change not toggle
- Gapsless workspaces should not have border
- Theme is not matching my synthwave-like I need to make it
- Gaps seems to be all monitors or none, my "gaps on a single ws" works ok-ish but it often fails / have weird quirks, need to investigate
