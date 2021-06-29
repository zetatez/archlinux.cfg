
# ip link
# ip link set wlan0 up
# iwlist wlan0 scan | grep ESSID

wpa_passphrase 26duju-123C 26duju123 > ~/.wifi.home.cfg
wpa_supplicant -B -c ~/.wifi.home.cfg -i wlan0
systemctl restart dhcpcd &


