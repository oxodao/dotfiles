#!/bin/sh
set -eu

case "${1:-region}" in
    region)
        # Cancelling slurp must not turn into an accidental full-screen capture.
        geometry=$(slurp) || exit 0
        [ -n "$geometry" ] || exit 0
        grim -g "$geometry" - | "${XDG_CONFIG_HOME:-$HOME/.config}/scripts/screenshot-menu"
        ;;
    full)
        grim - | "${XDG_CONFIG_HOME:-$HOME/.config}/scripts/screenshot-menu"
        ;;
    *) exit 2 ;;
esac
