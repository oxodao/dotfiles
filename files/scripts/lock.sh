#!/bin/bash
#maim /tmp/screenshot.png
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
i3lock -i /tmp/screenshotblur.png -c '#000000' -o '#191d0f' -w '#572020' -l '#ffffff' -e
