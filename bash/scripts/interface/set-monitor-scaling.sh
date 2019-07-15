#!/bin/bash

priDisplay=$(xrandr | grep 'primary' | awk '{ print$1'})
if [ $priDisplay = "DP-1" ]; then
    echo "Scaling for external display."
    gsettings set org.gnome.desktop.interface scaling-factor 2
    #xsettingsOverride="{'Gdk/WindowScalingFactor': <2>}"
    xsettingsOverride="{'Gdk/WindowScalingFactor': <2>, 'Xft/DPI': <76800>}"
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "$xsettingsOverride"
    #xrandr --output $priDisplay --scale 1x1 --fb 3840x2160 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 1x1 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 2x2 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 1.5x1.5 --fb 2560x1440 --panning 2560x1440 --auto
    #xrandr --output $priDisplay --scale 1.5x1.5 --fb 5760x3240 --panning 5760x3240 --auto
    #xrandr --output $priDisplay --scale 1.5x1.5 --fb 5760x3240 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 2x2 --fb 7680x4320 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 1.5x1.5 --fb 5760x3240 --panning 5760x3240 --auto
    xrandr --output $priDisplay --scale 1.5x1.5 --panning 5760x3240 --auto
elif [ $priDisplay = "eDP-1" ]; then
    echo "Scaling for internal display."
    # Eerst gnome scaling zoom-in op 200% zetten.
    # Deze lijkt geen effect te hebben, dus zet ', via Settings op 200%
    # --> scaling-factor moet 1, 2, 4 etc zijn, geen 3
    gsettings set org.gnome.desktop.interface scaling-factor 2
    gsettings set org.gnome.desktop.interface text-scaling-factor 1 

    # Gdk = For Chrome etc, moet een int zijn:
    # Xft = voor Ubuntu Settings e.d. 
    # Note also that DPI in the above example is expressed in 1024ths of an inch.
    # 76800 / 1024 = 72 dpi
    # 153600 / 1024 = 150 dpi
    # 307200 / 1024 = 300 dpi (4K)
    #export QT_AUTO_SCREEN_SCALE_FACTOR=1
    xsettingsOverride="{'Gdk/WindowScalingFactor': <2>}"
    #xsettingsOverride="{'Gdk/WindowScalingFactor': <2>, 'Xft/DPI': <76800>}"
    #xsettingsOverride="{'Gdk/WindowScalingFactor': <2>, 'Xft/DPI': <153600>}"
    #xsettingsOverride="{'Gdk/WindowScalingFactor': <2>, 'Xft/DPI': <307200>}"
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "$xsettingsOverride"
#    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Xft/DPI': <153600>}"
    xrandr --output $priDisplay --scale 1x1 --panning 3840x2160 --auto
    #xrandr --output $priDisplay --scale 2x2 --panning 1920x1080 --auto
    #xrandr --output eDP-1 --scale 1.5x1.5 --panning 2560x1440 --auto
    
    # Dit kun je alleen draaien als er geen grafische programma's draaien
    # (anders krijg je een hanger)
    # terminal kan wel blijven draaien.
    #sudo service gdm3 status restart
fi;

gsettings set org.gnome.desktop.interface cursor-size 64
