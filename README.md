# ARCHLINUX

## arch linux installation manuals

### pre-installation
- image

https://archlinux.org/download/

- verify signature
```bash
gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

- prepare installation medium

- boot the live evnvironment

- set keyboard layout
```bash
# available layouts
ls /usr/share/kbd/keymaps/**/*.map.gz

```
- verify the boot mode
```bash
ls /sys/firmware/efi/efivars

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

- partition disk
```bash

/dev/sda
->
/dev/sda1  512M   /boot
/dev/sda2  all    /
/dev/sda3  4G     swap


fdisk -l
fdisk /dev/sda
n
1
+512M

n
3
+4G

n
2
<CR> all for /

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3

mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt
```

### installation
```bash
# change mirrorlist
pacstrap /mnt base linux linux-firmware
```

### configure the system
- fstab
```bash
genfstab -U /mnt >> /mnt/etc/fstab

```

- chroot
```bash
vim /mnt/etc/pacman.d/mirrorlist
add
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
# generate /etc/locale.gen by running
locale-gen

vim /etc/locale.gen
	# uncomment en_US.UTF-8

# create the locale.conf file, and set the lang variable accordingly
vim /etc/locale.conf
LANG=en_US.UTF-8

# if you set the keyboard layout, make the changes persistent in vconsole.conf
vim /etc/vconsole.conf
# KEYMAP=de-latin1
```

- network confiuration
```bash
vi /etc/hostname
lorenzo

# Add matching entries to hosts(5):
vi /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	lorenzo.localdomain	lorenzo

# for github
199.232.28.133 raw.githubusercontent.com
```

- initramfs
creating a new initramfs is usually not required, because mkinitcpio was run on installation of the kernel package with pacstrap.

for lvm, system encryption or raid, modify mkinitcpio.conf and recreate the initramfs image:
```bash
mkinitcpio -P
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
add
%wheel ALL=(ALL)ALL
```

- boot loader
```bash
# choose and install a linux-capable boot loader. if you have an intel or amd cpu, enable microcode updates in addition.

pacman -S grub efibootmgr intel-ucode os-prober
grub-mkconfig -o /boot/grub/grub.cfg
uname -m
    # x86_64

mkdir /boot/grub
grub-install --target=x86_64-efi --efi-directoryr=/boot

```

- netowork
```bash
# wire
pacman -S dhcpcd
systemctl start dhcpcd
systemctl enable dhcpcd

# wireless
pacman -S netctl iw wpa_supplicant

# tools
pacman -S net-tools dnsutils inetutils iproute2
```

- ssh
```bash
pacman -S openssh
systemctl start sshd
systemctl enable sshd.service

vi /etc/ssh/sshd_config
# Permi ... yes

cd
ssh-keygen
```
- yay
```bash
git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```

### reboot
```bash
exit
umount -R /mnt
shutdown now
# eject moble disk
# select booting from exist os
```

### desktop
```bash
su - lorenzo

# Graphics card
pacman -S xf86-video-intel

# sound card
pacman -S alsa-utils pulseaudio-alsa

# touch pane
pacman -S xf86-input-synaptics

# font
pacman -S ttf-dejavu wqy-microhei

# input method
pacman -S fcitx fcitx-im fcitx-googlepinyin fcitx-configtool

# terminal simulator
pacman -S rxvt-unicode

vim ~/.xinitrc
add before exec
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# desktop
# xorg window manage sys
pacman -S xorg xorg-xinit

pacman -S alacarte

pacman -S firefox
```

### tools
```bash
pacman -S zsh fish task timew ranger git neovim tmux

pacman -S tmux
locale-gen "en_US.UTF-8"

pacman -S zathura lynx vit cmus evince

chsh -s /bin/zsh
```

### note 
```bash
pacman -S vim

pacman -Rsc vim 
pacman -Q vim
```

- dwm 
```bash
cd
git clone https://git.suckless.org/dwm

cd dwm
make && make install

git clone https://git.suckless.org/surf &

git clone https://git.suckless.org/st
```

- root
```bash
#!/bin/sh
#
# ~/.xinitrc
#

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx &
```

- lorenzo
```bash
#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# feh --bg-scale /home/michellgaby/img/arch.png
conky -x 0 -y 0 -d

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx &

while true
do
    xsetroot -name  "$(date -u +"%a %b %d %r")"
    sleep 1s
done &

#exec i3
exec dwm

# exec startx
```

