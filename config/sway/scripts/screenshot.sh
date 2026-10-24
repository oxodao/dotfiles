#!/bin/sh
set -eu

case "${1:-region}" in
    region)
        geometry=$(slurp) || exit 0
        [ -n "$geometry" ] || exit 0
        # Passer la position de fin de sélection au menu pour un meilleur positionnement sous Sway
        grim -g "$geometry" - | SCREENSHOT_MENU_GEOMETRY="$geometry" "${XDG_CONFIG_HOME:-$HOME/.config}/scripts/screenshot-menu"
        ;;
    full)
        grim - | "${XDG_CONFIG_HOME:-$HOME/.config}/scripts/screenshot-menu"
        ;;
    *) exit 2 ;;
esac
