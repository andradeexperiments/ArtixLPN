#!/bin/bash

# Para fazer essa instalação é necessário conexão com internet, então utilize:
# ln -s /etc/runit/sv/NetworkManager /run/runit/service/

# Fazendo update do sistema
pacman -Syu --noconfirm

# Criando swapfile
dd if=/dev/zero of=/swapfile bs=1G count=2 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap defaults 0 0" >> /etc/fstab

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

pacman -Sy --noconfirm
pacman -S --noconfirm artix-archlinux-support

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

pacman -Sy --noconfirm

# Ativiando serviço de bluetooth
#ln -s /etc/runit/sv/NetworkManager /run/runit/service/
ln -s /etc/runit/sv/bluetoothd /run/runit/service/

# Pacotes básicos pós instalação (ao instalar o pacote nvidia, xorg e diversos outros pacotes são instalados juntos) 
pacman -S --noconfirm linux-headers nvidia-dkms xorg-xset xorg-xinit ntfs-3g numlockx

# Instalando e configurando a interface de audio pipewire
pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
cp /usr/share/pipewire/pipewire* /etc/pipewire
echo '{ path = "/usr/bin/wireplumber" args = "" }' >> /etc/pipewire.conf
echo '{ path = "/usr/bin/pipewire" args = "-c pipewire-pulse.conf" }' >> /etc/pipewire.conf

# Pacotes rice pós instalação
pacman -S --noconfirm alacritty dunst neofetch picom ranger sxhkd bspwm neovim polybar rofi nitrogen pavucontrol ranger nemo scrot xclip playerctl bpytop firefox rofi-emoji

printf "\e[1;32mInstalado! Execute o move-files para finalizar.\e[0m"
