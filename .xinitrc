
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx &

while true
do
    xsetroot -name  "$(date -u +"%a %b %d %r")"
    sleep 1s
done &

exec dwm

# start dwm manually
# startx
