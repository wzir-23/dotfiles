# 1-2) Hide purple background behind non-obtrusive picture
# 3) Add desktop panel
# 4) Start with maximized terminal on main desktop
# 5) Adjust down brightness (openbsd on x250)
# 6) CapsLock -> Control
# 7) Start Openbox
xsetroot -solid purple &
feh --bg-fill .config/backdrops/desktop-1440x900.jpg
tint2 &
terminator -m &
xrandr --output eDP-1 --brightness 1.0
xmodmap .xmodmap
openbox
