
# wallpaper 
# feh --bg-fill --randomize ~/archlinux.cfg/pics
# feh --bg-fill ~/archlinux.cfg/pics/afternoon.jpg
feh --bg-fill ~/archlinux.cfg/pics/thinkdifferent.jpg
# feh --bg-fill ~/archlinux.cfg/pics/clown.jpg
# feh --bg-fill ~/archlinux.cfg/pics/eve.jpg
# feh --bg-fill ~/archlinux.cfg/pics/loulou.jpg
# feh --bg-fill ~/archlinux.cfg/pics/arch.jpg

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8;

# fcitx
fcitx &

# picom: must before the exec dwm
picom &

while true
do
    xsetroot -name  "$(date -u +"%a %b %d %r")"
    sleep 1s
done &

exec dwm

# start dwm manually
# startx


