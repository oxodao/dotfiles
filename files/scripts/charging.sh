#!/bin/bash
PLUGGED=$(sudo cat /sys/class/power_supply/AC/online)

if [ "$PLUGGED" = "1" ]; then
    echo "CHARGING"
else
    echo "-"
fi
