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

feh --bg-scale /home/lej/Desktop/Wallpapers/trees.jpg
# while true
# do
#     feh --randomize --bg-center /home/lej/Desktop/Wallpapers
#     sleep 300 
#     feh --randomize --bg-center /home/lej/Desktop/Wallpapers
#     sleep 300 
#     feh --randomize --bg-center /home/lej/Desktop/Wallpapers
#     sleep 300 
# done &

export BROWSER="chromium"

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login
/usr/bin/urxvtd -q -o -f

unclutter &
conky &
while true
do
    xsetroot -name "$(date +"%a %b %d %R")"
    sleep 5
done &

xbindkeys
exec dwm
