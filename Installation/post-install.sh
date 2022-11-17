#!/bin/bash

# Criando swapfile
dd if=/dev/zero of=/swapfile bs=1G count=2 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

# Habilitando repositórios do Arch Linux e melhorando velocidade
echo "# Arch" >> /etc/pacman.conf
echo "[extra]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo "[community]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo "ParallelDownloads = 10" >> /etc/pacman.conf

# Ativiando serviços de internet e bluetooth
ln -s /etc/runit/sv/NetworkManager /run/runit/service/
ln -s /etc/runit/sv/bluetoothd /run/runit/service/

# Pacotes básicos pós instalação (ao instalar o pacote nvidia, xorg e diversos outros pacotes são instalados juntos) 
pacman -S --noconfirm linux-headers nvidia-dkms xorg-xset ntfs-3g numlockx

# Instalando e configurando a interface de audio pipewire
pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
cp /usr/share/pipewire/pipewire* /etc/pipewire
echo '{ path = "/usr/bin/wireplumber" args = "" }' >> /etc/pipewire.conf
echo '{ path = "/usr/bin/pipewire" args = "-c pipewire-pulse.conf" }' >> /etc/pipewire.conf

# Pacotes rice pós instalação
pacman -S --noconfirm alacritty dunst neofetch picom ranger sxhkd bspwm neovim polybar rofi nitrogen 

# Criando diretórios e movendo arquivos
mkdir Others
mv ~/ArtixLPN/Scripts ~/Others
mv ~/ArtixLPN/seahorse.txt ~/Others
mv ~/ArtixLPN/Dotfiles/.config ~/
rm -rf ~/.bashrc
mv ~/ArtixLPN/Dotfiles/.bashrc ~/
mv ~/ArtixLPN/Dotfiles/.zshrc ~/
mv ~/ArtixLPN/Dotfiles/.dwm ~/
