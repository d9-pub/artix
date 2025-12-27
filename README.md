```fish
fdisk /dev/nvme0n1

g
ENTER
n
ENTER
ENTER
ENTER
+100M
ENTER
t
ENTER
1
ENTER
n
ENTER
ENTER
ENTER
ENTER
w
ENTER
```

<br>

```fish
mkfs.fat -F 32 /dev/nvme0n1p1

mkfs.ext4 /dev/nvme0n1p2
```

<br>

```fish
mount /dev/nvme0n1p2 /mnt

mkdir -p /mnt/boot/efi

mount /dev/nvme0n1p1 /mnt/boot/efi
```

<br>

```fish
dinitctl start ntpd
```

<br>

```fish
basestrap /mnt base linux linux-firmware intel-ucode grub efibootmgr dinit dhcpcd-dinit elogind-dinit opendoas neovim fish git
```

<br>

```fish
fstabgen -U /mnt >> /mnt/etc/fstab
```

<br>

```fish
artix-chroot /mnt
```

<br>

```fish
ln -sf /usr/share/zoneinfo/Asia/Novokuznetsk /etc/localtime

hwclock --systohc
```

<br>

uncomment `en_US.UTF-8 UTF-8`

```fish
nvim /etc/locale.gen

locale-gen
```

<br>

```fish
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
```

<br>

```fish
echo 'artix' >> /etc/hostname

touch /etc/hosts

nvim /etc/hosts
```

```
127.0.0.1 localhost
::1 localhost
127.0.1.1 artix
```

<br>  

```fish
passwd

useradd -mG wheel jack

passwd jack

echo 'permit persist :wheel' >> /etc/doas.conf

chown -c root:root /etc/doas.conf

chmod -c 0400 /etc/doas.conf
```

<br>   

```fish
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARTIX

nvim /etc/default/grub
```

`GRUB_TIMEOUT=0`

<br>  

```fish
grub-mkconfig -o /boot/grub/grub.cfg
```

<br>

```fish
nvim /etc/pacman.conf
```

```
Color
ILoveCandy
ParallelDownloads = 10
```

<br>

```fish
exit

umount -R /mnt

reboot
```

<br>

```fish
dinitctl enable dhcpcd

chsh

/usr/bin/fish

fish
```

<br>

```fish
doas pacman -Syu xorg-server xorg-xrandr xorg-xinit kitty ttf-firacode-nerd clang telegram-desktop firefox xf86-video-amdgpu make pkgconf openresolv tmux tree picom ranger rofi btop keepassxc flameshot openssh wireguard-tools xclip feh papirus-icon-theme fastfetch imagemagick nftables-dinit alsa-firmware alsa-utils-dinit pipewire-dinit pipewire-pulse-dinit pipewire-jack wireplumber-dinit
```

<br>

```fish
# GIT TIME << clone directories and files
```

<br>

```fish
doas dinitctl enable nftables

doas dinitctl enable alsa

doas cp /etc/dinit.d/config/aggety-default.conf /etc/dinit.d/config/aggety-tty1.conf
```

`GETTY_ARGS="--autologin jack"`

<br>

```fish
doas resolvconf -u

doas rm -rf /etc/resolv.conf.bak
```

<br>

```fish
alsamixer

doas alsactl store

doas alsactl restore
```
