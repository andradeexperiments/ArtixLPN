# .bashrc

export LANG="en_US.UTF-8"
export LC_COLLATE="C"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
PS1='\W  '

# Bash commands
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=auto'
alias rm='sudo rm -r'

# PACMAN
alias pr='sudo pacman -R'
alias prr='sudo pacman -Rs'
alias pro='sudo pacman -Rs $ (pacman -Qtdq)'
alias pl='sudo pacman -S'
alias pq='pacman -Ss'
alias pu='sudo pacman -Syu'

# XBPS
#alias xr='sudo xbps-remove'
#alias xrr='sudo xbps-remove -R'
#alias xro='sudo xbps-remove -o'
#alias xl='sudo xbps-install'
#alias xq='xbps-query -Rs'
#alias xu='xi -Su'
#alias xusrc='cd /home/andrade/Others/void-packages && git pull && ./xbps-src update-sys'

# Folders
alias scripts='ranger ~/Others/Scripts'
alias steamapps='ranger .local/share/Steam/steamapps'

# Aplicativos
alias vim='nvim'
alias read='devour mupdf'
alias ani='ani-cli'
alias vis='cli-visualizer'
alias updatedb='sudo updatedb'
alias neofetch='neofetch --source ~/Others/copland.txt'

#neofetch --source ~/Others/copland.txt
