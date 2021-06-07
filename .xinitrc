
# wallpaper 
# feh --bg-fill --randomize ~/archlinux.cfg/pics
# feh --bg-fill ~/archlinux.cfg/pics/afternoon.jpg
# feh --bg-fill ~/archlinux.cfg/pics/FG001.jpg
# feh --bg-fill ~/archlinux.cfg/pics/thinkdifferent.jpg
feh --bg-fill ~/archlinux.cfg/pics/linux.png
# feh --bg-fill ~/archlinux.cfg/pics/the-evening-star.jpg
# feh --bg-fill ~/archlinux.cfg/pics/dancer.jpg;

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8;

# fcitx
fcitx &

# sudo pacman -S picom
picom &

while true
do
    # sudo pacman -S acpi
    x1=$(date +"%H:%M:%S %m/%d/%Y")
    x2=$(acpi|grep Discharging|sed 's/,//g'|awk '{print $4" discharging"}')
    x3=$(acpi|grep Charging|awk '{print $5}'|awk -F : '{print $1"h/"$2"m until charged"}')
    x4=$(acpi|grep Full|awk '{print $4" full charged"}')
    x5=$(acpi|grep Unknown|awk '{print $4" full charged"}')
    x6=$(iw dev wlan0 link|grep Connected|awk '{print "wifi is on"}')
    x7=$(iw dev wlan0 link|grep "Not connected"|awk '{print "wifi is off"}')
    xsetroot -name "$x1 $x2$x3$x4$x5 $x6$x7"
    sleep 1s
done &

exec dwm

#startx


