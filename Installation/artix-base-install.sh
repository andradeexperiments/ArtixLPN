#!/bin/bash

# Time Zone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

# Locale
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "artix" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 artix.localdomain artix" >> /etc/hosts

# Senha do root
echo root:artix | chpasswd

# Pacotes básicos
pacman -S --noconfirm grub networkmanager networkmanager-runit network-manager-applet bluez-utils bluez-runit ntp-runit gvfs

#BIOS
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#Usuário
useradd -m andrade
echo andrade:artix | chpasswd
usermod -aG libvirt andrade

echo "andrade ALL=(ALL) ALL" >> /etc/sudoers.d/andrade

printf "\e[1;32mPronto! Digite exit, umount -a e reboot.\e[0m"

