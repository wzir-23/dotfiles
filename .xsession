#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

else
    xrdb -merge - <<EOF



EOF
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Set Swedish kbd, take control over caps lock
setxkbmap -option ctrl:nocaps se

# Possibly extend battery time by some down tuning
# 1) dim the screen lightly
xrandr --output eDP1 --brightness 0.80
# 2) reduce cpu speed from 2600 MHz
sudo sysctl -w machdep.est.frequency.target=1000

# application start such as conky and setting background
# picture is moved to ~/.config/i3/start_progrs

# breadcrumbs from my window manager journey
# exec /usr/X11R7/bin/ctwm -W
# exec /usr/pkg/bin/openbox
exec /usr/pkg/bin/i3
