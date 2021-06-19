
# archlinux recognize USB

# - find usb idVendor, idProduct
lsusb -v|grep -E "idVendor|idProduct"
	# idVendor           0x13fe Kingston Technology Company Inc.
    # idProduct          0x5500 Flash drive

echo "options usb-storage quirks=0x0781:0x5567:u" | sudo tee /etc/modprobe.d/ingore_nas.conf
sudo mkinitcpio -p linux
# sudo reboot



