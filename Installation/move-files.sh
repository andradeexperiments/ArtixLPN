# Instalando o yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay -S --noconfirm nerd-fonts-complete

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

printf "\e[1;32mFinalizado! Aproveite seu sistema.\e[0m"
