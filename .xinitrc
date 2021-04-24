
# wallpaper 
feh --bg-max --no-fehbg --randomize ~/archlinux.cfg/pics

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8;

fcitx &

while true
do
    xsetroot -name  "$(date -u +"%a %b %d %r")"
    sleep 1s
done &

exec dwm

# start dwm manually
# startx

# capacity
picom -b



