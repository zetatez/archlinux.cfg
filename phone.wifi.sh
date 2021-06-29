
# ip link
ip link set wlan0 up
# iwlist wlan0 scan | grep ESSID
wpa_passphrase 101100001011 yuhaiyan > ~/.wifi.phone.cfg
wpa_supplicant -B -c ~/.wifi.phone.cfg -i wlan0

systemctl restart dhcpcd &

