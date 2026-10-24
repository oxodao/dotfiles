#!/usr/bin/env python3
"""Focus a matching Wayland/Xwayland window, or launch the given command."""

import json
import os
import re
import subprocess
import sys


def windows(node):
    yield node
    for child in node.get("nodes", []) + node.get("floating_nodes", []):
        yield from windows(child)


def main():
    if len(sys.argv) < 3:
        sys.exit("Usage: focus-or-launch.py REGEX COMMAND [ARG...]")

    pattern = re.compile(sys.argv[1], re.IGNORECASE)
    result = subprocess.run(
        ["swaymsg", "-r", "-t", "get_tree"],
        capture_output=True, text=True, check=True,
    )
    for node in windows(json.loads(result.stdout)):
        properties = node.get("window_properties") or {}
        identifiers = (
            node.get("app_id"), properties.get("class"), properties.get("instance")
        )
        if any(pattern.search(value) for value in identifiers if value):
            focused = subprocess.run(
                ["swaymsg", "-r", f'[con_id={node["id"]}] focus'],
                capture_output=True, text=True, check=True,
            )
            if any(reply.get("success") for reply in json.loads(focused.stdout)):
                return

    os.execvp(sys.argv[2], sys.argv[2:])


if __name__ == "__main__":
    main()
