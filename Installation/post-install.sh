#!/bin/bash

# Ativiando serviços de internet e bluetooth
ln -s /etc/runit/sv/NetworkManager /run/runit/service/
ln -s /etc/runit/sv/bluetoothd /run/runit/service/

# Pacotes básicos pós instalação (ao instalar o pacote nvidia, xorg e diversos outros pacotes são instalados juntos) 
echo "ParallelDownloads = 10" >> /etc/pacman.conf
pacman -S nvidia xorg-xset ntfs-3g 

# Instalando e configurando a interface de audio pipewire
pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
cp /usr/share/pipewire/pipewire* /etc/pipewire
echo '{ path = "/usr/bin/wireplumber" args = "" }' >> /etc/pipewire.conf
echo '{ path = "/usr/bin/pipewire" args = "-c pipewire-pulse.conf" }' >> /etc/pipewire.conf

# Criando diretórios e movendo arquivos
mkdir Others
mv Artix-Linux-PixelNight/Scripts ~/Others
mv Artix-Linux-PixelNight/seahorse.txt ~/Others
mv Artix-Linux-PixelNight/Dotfiles/.config ~/
rm -rf ~/.bashrc
mv Artix-Linux-PixelNight/Dotfiles/.bashrc ~/
mv Artix-Linux-PixelNight/Dotfiles/.zshrc ~/
mv Artix-Linux-PixelNight/Dotfiles/.dwm ~/