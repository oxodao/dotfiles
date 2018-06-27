#!/bin/bash
NOW=$(cat /sys/class/power_supply/BAT0/energy_now)
FULL=$(cat /sys/class/power_supply/BAT0/energy_full)

PERC=$(echo "scale=10; $NOW/$FULL" | bc)
PERC=$(printf %.$2f $(echo "100*$PERC" | bc))
PERC="  $PERC%"

echo $PERC
