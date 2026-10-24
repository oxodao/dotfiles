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
```

# Customizations

This setup requires a ~/.zshrc.custom that lets you customize the setup for the current device

[X11]: This also requires a ~/.config/i3/custom.`hostname`.conf file (can be empty).

[WL]: This also requires a ~/.config/hypr/hyprland/host/`hostname`.conf file (can be empty).

[SwayFX]: Optional machine overrides go in `~/.config/sway/custom.<hostname>.conf`.

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

### SwayFX

The configuration lives in `config/sway/config`. It keeps i3's workspace names,
AZERTY shortcuts, tabbed layout, assignments and colors. Layout/workspace bindings
are copied into `config/sway/keybinds.conf`, independently of i3. Both i3 and
Hyprland are unchanged.
Keyboard settings match Hyprland: French OSS, Caps Lock/Escape swapped.

Install the following packages (names depend on your distribution):

- `swayfx` (usually provides the `sway` command), `swaybg`, `swaylock`, `xorg-xwayland`
- `waybar`, a Wayland-capable `rofi`, `rofi-calc`, `rofi-emoji`
- `grim`, `slurp`, `wl-clipboard`, `python-gobject`, GTK 3, `gtk-layer-shell`, `curl`, `libnotify`
- `wireplumber` (`wpctl`), `brightnessctl`, `playerctl`, `mate-polkit`, `gcr` (SSH agent)
- `xdg-desktop-portal-wlr` (screen sharing), `xdg-desktop-portal-gtk` (file chooser)
- Existing startup apps: `udiskie`, `dunst`, `network-manager-applet`, `blueman`,
  `syncthing`, `kdeconnect`; existing terminal/apps/fonts and `metaprint` for Waybar.

With `~/.config` linked to this repository, select the Sway session in your login
manager, or run `sway` from a TTY. Before switching, validate with:

```sh
sway --validate -c ~/.config/sway/config
```

- `Super+Shift+c`: reload; `Super+v` / `Super+b`: split vertically / horizontally.
- `Super+Return`: focus Alacritty or start tmux; `Super+Shift+Return`: new terminal.
- `Print` / `Super+s`: select a capture region; add Shift for all screens.
  Both use the existing screenshot menu (copy/save/upload).
- `Super+Delete`: lock with swaylock. No automatic idle/suspend is configured.
- `Super+d` / `Super+Shift+d`: restore/remove gaps on the current workspace, as in i3.

`custom.severusdesk.conf` uses the existing Hyprland monitor layout. Verify connector
names with `swaymsg -t get_outputs`. On that host, `Super+Home` enables only the
right screen; `Super+Shift+Home` restores all three.

Waybar uses `config/waybar/sway.jsonc` and `sway.css`, inheriting the existing
status modules/style without changing Hyprland's bar. The `hyprland` arguments to
`metaprint` are its existing output-format names, not compositor commands.

Check native app IDs/classes with `swaymsg -t get_tree` if an assignment does not
match. X11-only tools (`autorandr`, `xset`, `feh`, `maim`, `i3lock`, `xbacklight`,
`autokey`, `xdotool`) are not started. The autoclicker shortcuts are not ported yet.
Keyring auto-unlock still depends on your login manager/PAM configuration.
SSH uses GCR's agent at `$XDG_RUNTIME_DIR/gcr/ssh`; no standalone `ssh-agent`
user service is needed.

### Previous Hyprland migration notes

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
