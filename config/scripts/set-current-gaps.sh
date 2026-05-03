#!/bin/sh

# Script to emulate my win+d / win+shift+d from my i3 setup on hyprland

gapsin="$1"
gapsout="$2"

if [ -z "$gapsin" ] || [ -z "$gapsout" ]; then
  echo "Usage: $0 <gapsin_px> <gapsout_px>" >&2
  exit 1
fi

case "$gapsin" in
  *[!0-9]*)
    echo "Error: gapsin must be a positive number or 0" >&2
    exit 1
    ;;
esac

case "$gapsout" in
  *[!0-9]*)
    echo "Error: gapsout must be a positive number or 0" >&2
    exit 1
    ;;
esac

ws_json="$(hyprctl activeworkspace -j)"
id="$(printf '%s' "$ws_json" | jq -r '.id')"
name="$(printf '%s' "$ws_json" | jq -r '.name')"

case "$name" in
  special:*)
    target="$name"
    ;;
  "$id")
    target="$id"
    ;;
  *)
    target="name:$name"
    ;;
esac

hyprctl keyword workspace "$target,gapsin:$gapsin,gapsout:$gapsout"
