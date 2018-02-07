#!/bin/bash
MON1="VGA-1"
MON2="VGA-2"
LAPTOP="VGA-3"

xrandr --output $LAPTOP --left-of $MON1 --left-of $MON2
xrandr --output $MON2 --right-of $LAPTOP
xrandr --output $MON1 --right-of $MON2
