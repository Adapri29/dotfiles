#!/bin/bash

WALLPAPER=$1

awww img "$WALLPAPER" --transition-type grow --transition-duration 1

matugen image "$WALLPAPER"

killall waybar && waybar &
