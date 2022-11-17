#!/bin/bash

# Para fazer essa instalação é necessário conexão com internet, então utilize:
# ln -s /etc/runit/sv/NetworkManager /run/runit/service/

# Fazendo update do sistema
sudo pacman -Syu --noconfirm

# Criando swapfile
sudo dd if=/dev/zero of=/swapfile bs=1G count=2 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile none swap defaults 0 0" >> /etc/fstab

# Habilitando repositórios do Arch Linux e melhorando velocidade

echo "[universe]" >> /etc/pacman.conf
echo " " >> /etc/pacman.conf
echo 'Server = https://universe.artixlinux.org/$arch' >> /etc/pacman.conf
echo 'Server = https://mirror1.artixlinux.org/universe/$arch' >> /etc/pacman.conf
echo 'Server = https://mirror.pascalpuffke.de/artix-universe/$arch' >> /etc/pacman.conf
echo 'Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch' >> /etc/pacman.conf
echo 'Server = https://mirror1.cl.netactuate.com/artix/universe/$arch' >> /etc/pacman.conf
echo 'Server = https://ftp.crifo.org/artix-universe/' >> /etc/pacman.conf
echo " " >> /etc/pacman.conf

sudo pacman -Sy --noconfirm
sudo pacman -S --noconfirm artix-archlinux-support

echo "# Arch" >> /etc/pacman.conf
echo "[extra]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo " " >> /etc/pacman.conf
echo "[community]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo " " >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf
echo " " >> /etc/pacman.conf

sudo pacman -Sy --noconfirm

# Ativiando serviço de bluetooth
#ln -s /etc/runit/sv/NetworkManager /run/runit/service/
sudo ln -s /etc/runit/sv/bluetoothd /run/runit/service/

# Pacotes básicos pós instalação (ao instalar o pacote nvidia, xorg e diversos outros pacotes são instalados juntos) 
sudo pacman -S --noconfirm linux-headers nvidia-dkms xorg-xset xorg-xinit ntfs-3g numlockx

# Instalando e configurando a interface de audio pipewire
sudo pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
sudo cp /usr/share/pipewire/pipewire* /etc/pipewire
sudo echo '{ path = "/usr/bin/wireplumber" args = "" }' >> /etc/pipewire.conf
sudo echo '{ path = "/usr/bin/pipewire" args = "-c pipewire-pulse.conf" }' >> /etc/pipewire.conf

# Pacotes rice pós instalação
sudo pacman -S --noconfirm alacritty dunst neofetch picom ranger sxhkd bspwm neovim polybar rofi nitrogen 

# Criando diretórios e movendo arquivos
mkdir ~/Others
mv ~/ArtixLPN/Scripts ~/Others/
mv ~/ArtixLPN/seahorse.txt ~/Others/
mv ~/ArtixLPN/Dotfiles/.config ~/
rm -rf ~/.bashrc
mv ~/ArtixLPN/Dotfiles/.bashrc ~/
mv ~/ArtixLPN/Dotfiles/.zshrc ~/
mv ~/ArtixLPN/Dotfiles/.dwm ~/
mv ~/ArtixLPN/Dotfiles/.xinitrc ~/
