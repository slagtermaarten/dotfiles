#!/bin/bash

EXTERNAL_OUTPUT="LVDS1"
INTERNAL_OUTPUT="HDMI1"

if [ $1 eq 1 ]; then
    xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
else
    xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
fi
