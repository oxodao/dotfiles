#!/bin/bash
PLUGGED=$(sudo cat /sys/class/power_supply/AC/online)

NOW=$(cat /sys/class/power_supply/BAT0/energy_now)
FULL=$(cat /sys/class/power_supply/BAT0/energy_full)

PERC=$(echo "scale=10; $NOW/$FULL" | bc)
PERC=$(printf %.$2f $(echo "100*$PERC" | bc))
if [ "$PLUGGED" = "1" ]; then
PERC=" $PERC"
else
PERC="  $PERC"
fi

echo "$PERC%"
