


echo "options usb-storage quirks=0x0781:0x5567:u" | sudo tee /etc/modprobe.d/ingore_nas.conf
sudo mkinitcpio -p linux
reboot