#!/bin/bash
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}"

# DP-1 is external
xrandr --output DP-1 --scale 1x1
#xrandr --output DP-1 --scale 2x2
#xrandr --output DP-1 --scale 1.5x1.5
xrandr --output DP-1 --panning 3840x2160
