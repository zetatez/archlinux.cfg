# ARCHLINUX

## arch linux installation manuals

### pre-installation
- image
    [archlinux.iso](https://archlinux.org/download/)

- verify signature
```bash
gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

- prepare installation medium

- boot the live evnvironment

- verify the boot mode. necessary !

```bash
ls /sys/firmware/efi/efivars
```

- set keyboard layout
```bash
# available layouts
ls /usr/share/kbd/keymaps/**/*.map.gz
```

- connect to the internet
```bash
ip link
ip link set wlan0 up
ip link
iwlist wlan0 scan|grep ESSID
wpa_passphrase 26duju-123C 26duju123 > internet.cfg
wpa_supplicant -c internet.cfg -i wlan0 &
dhcpcd &
ping archlinux.org
```

- update system clock
```bash
timedatectl set-ntp true
```

- mirrorlist
```bash
vim /etc/pacman.d/mirrorlist
pacman -Sy
```

- partition disk
```bash
# /dev/sda
# ->
# /dev/sda1  512M   /boot
# /dev/sda2  4G     swap
# /dev/sda3  all    /

lsblk

parted /dev/sda
    # mktable
    # gpt
    # yes
    # quit

fdisk -l
cfdisk /dev/sda
# n
# 1
# +300M
# type: EFI

# n
# 2
# +4G
# type swap

# n
# 3
# <CR> all for /
# type filesystem

# mind the format order, efi last !!!
mkfs.ext4 /dev/sda3
mkfs.vfat /dev/sda1
mkswap -f /dev/sda2
swapon /dev/sda2

mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mount /dev/sda3 /mnt
```

### installation
```bash
# change mirrorlist
pacstrap /mnt base linux linux-firmware
pacstrap /mnt vim dhcpcd iwd sudo
```

### configure the system
- fstab
```bash
# check fstab !!!
genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
```

- chroot
```bash
vim /mnt/etc/pacman.d/mirrorlist
    # add
    Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch
    Server = http://mirrors.163.com/archlinux/$repo/os/$arch

arch-chroot /mnt

# install vim
pacman -S vim
```

- time zone
```bash
# time zone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# generate /etc/adjtime
hwclock --systohc --utc

```

- localization
```bash
vim /etc/locale.gen
	# uncomment en_US.UTF-8

export LANG=en_US.UTF-8

# generate /etc/locale.gen by running
locale-gen

# create the locale.conf file, and set the lang variable accordingly
vim /etc/locale.conf
    LANG=en_US.UTF-8

# if you set the keyboard layout, make the changes persistent in vconsole.conf
# vim /etc/vconsole.conf
# KEYMAP=de-latin1
```

- network confiuration
```bash
vi /etc/hostname
    Arch

vi /etc/hosts
    127.0.0.1	localhost
    ::1		localhost
    127.0.1.1	Arch.localdomain	Arch

# for github
199.232.28.133 raw.githubusercontent.com
```

- root password
```bash
passwd
```

- add none root user
```bash
pacman -S base-devel

useradd -m -g wheel -s /bin/bash lorenzo

passwd lorenzo

# add root to user lorenzo
pacman -S sudo
vim /etc/sudoers
    # uncomment
    %wheel ALL=(ALL)ALL
```

- boot loader
```bash
# choose and install a linux-capable boot loader. if you have an intel or amd cpu, enable microcode updates in addition.

pacman -S grub efibootmgr intel-ucode

uname -m
# x86_64

grub-install --target=x86_64-efi --efi-directoryr=/boot/EFI --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

```

- netowork
    - wireless
    ```bash
    pacman -S wpa_supplicant netctl wireless_tools 

    # tools
    pacman -S net-tools inetutils iproute2
    ```

    - wire
    ```bash
    pacman -S dhcpcd

    # if install dhcpcd fail, try reinstall linux
    pacman -S linux
    which dhcpcd

    systemctl enable dhcpcd
    systemctl start dhcpcd
    ```

- bluetooth
```bash
# bluetooth protocl
pacman -S bluez

# bluetoothctl
pacman -S bluez-utils

systemctl enable bluetooth.service
systemctl start bluetooth.service

## Console
# bluetoothctl - Pairing a device from the shell is one of the simplest and most reliable options.

# bluetooth for audio
pacman -S pulseaudio-bluetooth
# start manually
pulseaudio -k
# start
ulseaudio --start

vim /etc/bluetooth/main.conf
    [Policy]
    AutoEnable=true

    [General]
    DiscoverableTimeout = 0

bluetoothctl
	select <mac>
	agent KeyboardOnly
	default-agent
	devices
	power on
	scan on
	trust <mac>
	pair <mac>
	connect <mac>
```

- ssh
```bash
pacman -S openssh
systemctl enable sshd
systemctl start sshd

vi /etc/ssh/sshd_config
    # Permi ... yes

cd
ssh-keygen
```
- git
```bash
pacman -S git
```

### reboot
```bash
exit
umount -R /mnt
shutdown now
# eject moble disk, modify boot order
```

### drivers
```bash
su - lorenzo
# list drivers
lspci | grep VGA

# Graphics card
pacman -S xf86-video-intel
pacman -S nvidia

# 3D
pacman -S mesa

# sound card
pacman -S alsa-utils pulseaudio

# touch pane
pacman -S xf86-input-synaptics

```

- softwares
```bash
# font
pacman -S noto-fonts-cjk
pacman -S nerd-fonts
pacman -S font-awesome
pacman -S ttf-dejavu
pacman -S wqy-microhei

# input method
pacman -S fcitx fcitx-im fcitx-googlepinyin fcitx-configtool

vim ~/.xinitrc
    # add
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"
    fcitx &

pacman -S vim neovim
pacman -S zsh fish task timew ranger git lazygit fzf neovim tmux zathura w3m vit cmus evince mutt
pacman -S python julia scala sbt

chsh -s /bin/zsh
touch ~/.zshrc

su -
chsh -s /bin/zsh
touch ~/.zshrc
```

- suckless: dwm, demenu, st, surf
```bash
# terminal simulator
pacman -S rxvt-unicode

# DWM 
# none root
cd
git clone https://git@github:zetatez/archlinux.cfg.git &

cd
mkdir suckless; cd suckless
# git clone https://git.suckless.org/dwm &
# git clone http://git.suckless.org/dmenu &
# git clone https://git.suckless.org/st &
# git clone https://git.suckless.org/surf &

git clone https://git@github:zetatez/arch-dwm.git &
git clone https://git@github:zetatez/arch-dmenu.git &
git clone https://git@github:zetatez/arch-st.git &
git clone https://git@github:zetatez/arch-surf.git &
git clone https://git@github:zetatez/arch-slock.git &

# dependency
sudo pacman -S base-devel
sudo pacman -S alacarte
sudo pacman -S xorg-server
sudo pacman -S xorg-apps
sudo pacman -S xorg-xinit
wait

cd ~/suckless/arch-dwm   ; sudo make && make clean install
cd ~/suckless/arch-dmenu ; sudo make && make clean install
cd ~/suckless/arch-st    ; sudo make && make clean install
cd ~/suckless/arch-surf  ; sudo make && make clean install
cd ~/suckless/arch-slock ; sudo make && make clean install

vim ~/.xinitrc
# --------------
# wallpaper 
# feh --bg-fill --randomize ~/archlinux.cfg/pics
# feh --bg-fill ~/archlinux.cfg/pics/afternoon.jpg
# feh --bg-fill ~/archlinux.cfg/pics/thinkdifferent.jpg
# feh --bg-fill ~/archlinux.cfg/pics/clown.jpg
# feh --bg-fill ~/archlinux.cfg/pics/eve.jpg
# feh --bg-fill ~/archlinux.cfg/pics/loulou.jpg
feh --bg-fill ~/archlinux.cfg/pics/arch.jpg
# feh --bg-fill ~/archlinux.cfg/pics/linux.png

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8;

# fcitx
fcitx &

# sudo pacman -S picom
picom &

while true
do
    # sudo pacman -S acpi
    x1=$(date +"%H:%M:%S %m/%d %Y")
    x2=$(acpi|grep Discharging|sed 's/,//g'|awk '{print $4" discharging"}')
    x3=$(acpi|grep Charging|awk '{print $5}'|awk -F : '{print $1"h/"$2"m until charged"}')
    x4=$(acpi|grep Full|awk '{print $4" full charged"}')
    xsetroot -name "$x1 $x2$x3$x4"
    sleep 1s
done &

exec dwm

# start dwm manually
#startx
# --------------
```


### fonts
```bash
pacman -S wqy-microhei
pacman -S wqy-microhei-lite
pacman -S wqy-bitmapfont
pacman -S wqy-zenhei
pacman -S ttf-arphic-ukai
pacman -S ttf-arphic-uming
pacman -S adobe-source-han-sans-cn-fonts
pacman -S adobe-source-han-serif-cn-fonts
pacman -S noto-fonts-cjk

# available fonts
ls -lR /user/share/fonts
```

#### device check
```bash
# disk info
sudo pacman -S smartmontools
sudo smartctl -A /dev/sda

# system info 
sudo pacman -S dmidecode
sudo dmidecode
```

### [pikaur](https://github.com/actionless/pikaur)
```
cd
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri

pikaur -Syu
pikaur -S google-chrome
```

# Archlinux-timeshift
Arch linux OS backup and restore

## timeshift
```
pikaur -S timeshift
```

## config timeshift
```bash
sudo timeshift-launcher
```
- ext4 -> RSYNC
- /timeshift
- location, schedule, users, filters, misc

## restore from snapshots
### can not enter current system: restore to a new system
```bash
# os crashed

# use live CD, entering a temp OS

# install samba, timeshift

# mount remote backup disk 

# set snapshot location 

# restore
sudo timeshift --restore --snapshot-device /dev/nvme0nX
```

### can     enter current system: restore to a current system
```bash
# get snapshot list
sudo timeshift --list

# choose recentest snapshot
sudo timeshift --restore --snapshot '20XX-XXXX' --skip-grub
```



### pacman 
```bash
# update mirrors list
# sduo pacman -Sy

# update system
# pacman -Syyu

# remove package
# pacman -R

# remove package recursivly
# pacman -Rsc vim 
```

