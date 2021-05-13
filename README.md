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

- verify the boot mode, must done !
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
/dev/sda
->
/dev/sda1  512M   /boot
/dev/sda2  4G     swap
/dev/sda3  all    /


lsblk

parted /dev/sda
    mktable
    gpt
    yes
    quit

fdisk -l
cfdisk /dev/sda
n
1
+300M
type: EFI

n
2
+4G
type swap

n
3
<CR> all for /
type filesystem

# efi 分区
# 注意格式化顺序，会吃药的，efi分区最后格式化未vfat
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
genfstab -U /mnt
genfstab -U /mnt >> /mnt/etc/fstab
```

- chroot
```bash
vim /mnt/etc/pacman.d/mirrorlist
add
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
vim /etc/vconsole.conf
# KEYMAP=de-latin1
```

- network confiuration
```bash
vi /etc/hostname
Arch
# Add matching entries to hosts(5):
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

    1.  [Install](https://wiki.archlinux.org/index.php/Install) the [bluez](https://archlinux.org/packages/?name=bluez) package, providing the Bluetooth protocol stack.

    2.  [Install](https://wiki.archlinux.org/index.php/Install) the [bluez-utils](https://archlinux.org/packages/?name=bluez-utils) package, providing the `bluetoothctl` utility. Alternatively install [bluez-utils-compat](https://aur.archlinux.org/packages/bluez-utils-compat/)AUR to additionally have the [deprecated BlueZ tools](https://wiki.archlinux.org/index.php/Bluetooth#Deprecated_BlueZ_tools).

    3.  The generic Bluetooth driver is the `btusb` kernel module. [Check](https://wiki.archlinux.org/index.php/Kernel_module#Obtaining_information) whether that module is loaded. If it's not, then [load the module](https://wiki.archlinux.org/index.php/Kernel_module#Manual_module_handling).

    4.  [Start/enable](https://wiki.archlinux.org/index.php/Start/enable) `bluetooth.service`.

        **Note:**
        -   By default the bluetooth daemon will only give out bnep0 devices to users that are a member of the `lp` [group](https://wiki.archlinux.org/index.php/Users_and_groups#System_groups). Make sure to add your user to that group if you intend to connect to a bluetooth tether. You can change the group that is required in the file `/usr/share/dbus-1/system.d/bluetooth.conf`.
        -   Some Bluetooth adapters are bundled with a Wi-Fi card (e.g. [Intel Centrino](https://www.intel.com/content/www/us/en/wireless-products/centrino-advanced-n-6235.html)). These require that the Wi-Fi card is firstly enabled (typically a keyboard shortcut on a laptop) in order to make the Bluetooth adapter visible to the kernel.
        -   Some Bluetooth cards (e.g. Broadcom) conflict with the network adapter. Thus, you need to make sure that your Bluetooth device gets connected before the network service boot.
        -   Some tools such as hcitool and hciconfig have been deprecated upstream, and are no longer included in [bluez-utils](https://archlinux.org/packages/?name=bluez-utils). Since these tools will no longer be updated, it is recommended that scripts be updated to avoid using them. If you still desire to use them, install [bluez-utils-compat](https://aur.archlinux.org/packages/bluez-utils-compat/)AUR. See [FS#53110](https://bugs.archlinux.org/task/53110) and [the Bluez mailing list](https://www.spinics.net/lists/linux-bluetooth/msg69239.html) for more information.

*   **bluetoothctl** — Pairing a device from the shell is one of the simplest and most reliable options.
    *   **Tip:** To automate bluetoothctl commands, use `echo -e "<command1>\n<command2>\n" | bluetoothctl` or `bluetoothctl -- command`

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
    # -----------------------
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"
    fcitx &
    # -----------------------

pacman -S vim neovim
pacman -S zsh fish task timew ranger git lazygit fzf neovim tmux zathura w3m vit cmus evince mutt
pacman -S python julia scala sbt

chsh -s /bin/zsh

touch ~/.zshrc

su -
touch ~/.zshrc
```

- suckless: dwm, demenu, st, surf
    - dwm [https://wiki.archlinux.org/index.php/Dwm_(简体中文)]
    - demenu [https://wiki.archlinux.org/index.php/Dmenu]
    - dwm [https://zhuanlan.zhihu.com/p/183861786]
```bash
# !!! terminal simulator
pacman -S rxvt-unicode

# desktop
# none root
cd
git clone https://git.suckless.org/dwm &
git clone http://git.suckless.org/dmenu &
git clone https://git.suckless.org/st &
git clone https://git.suckless.org/surf &

# dependency
pacman -S base-devel
pacman -S alacarte
pacman -S xorg-server
pacman -S xorg-apps
pacman -S xorg-xinit

wait

cd dwm
sudo make && make clean install

cd
cd dmenu
sudo make && make clean install

cd
cd st
sudo make && make clean install

cd
cd surf
sudo make && make clean install

vim ~/.xinitrc
# -------------------------------
# show time in dwm
while true
do
    xsetroot -name  "$(date -u +"%a %b %d %r")"
    sleep 1s
done &

exec dwm

# start dwm manually 
# exec startx
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
# 磁盘检测
sudo pacman -S smartmontools
sudo smartctl -A /dev/sda   #硬盘
sudo smartctl -d sat -A /dev/sdc #usb设备

# cpu 与显卡：
# 如下两款是目前找到的，最佳的图形化查看 cpu 与显卡信息的软件。

yay -S cpu-x
yay -S gpu-viewer

# 系统完整信息:
# 使用 dmidecode 可以完整查看系统绝大部分硬件信息，包括较难得到的内存频率等。

sudo pacman -S dmidecode
sudo dmidecode
```



### pikaur

[https://github.com/actionless/pikaur]

```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri

pikaur -Syu
pikaur -S google-chrome

pikaur -s mate-power-manager



```
