##################################
############# PROMPT #############
##################################
#6c7086
PROMPT='%F{8}$%f '
PROMPT='%F{#bb9af7}%1~%f %F{White}%f  '

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

##################################
############# BÁSICO #############
##################################

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

xset r rate 300 50
PATH=$PATH:$HOME/Others/Scripts

##################################
############# ALIAS ##############
##################################

# Zsh commands
alias la='ls -a'
alias ll='ls -l'
alias ls='ls --color=auto'
alias rm='sudo rm -r'
alias cp='cp -r'

# PACMAN
alias pr='sudo pacman -R'
alias prr='sudo pacman -Rs'
alias pro='sudo pacman -Rs $ (pacman -Qtdq)'
alias pl='sudo pacman -S'
alias ps='pacman -Ss'
alias pq='pacman -Q'
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
alias reader='devour mupdf'
alias ani='ani-cli'
alias mov='mov-cli'
alias vis='cli-visualizer'
alias updatedb='sudo updatedb'
alias neofetch='neofetch --source ~/Others/seahorse.txt'
#neofetch --source ~/Others/seahorse.txt

##################################
############# COLORS #############
##################################

#LS_COLORS='rs=0:di=1;97:fi=1;90';
LS_COLORS='rs=0:di=1;34:fi=1;30:ln=1;34'
export LS_COLORS

##################################
############ PIPEWIRE ############
##################################
export PIPEWIRE_LATENCY=128/48000

##################################
############## XDEB ##############
##################################


#export XDEB_OPT_DEPS=true
#export XDEB_OPT_SYNC=true
#export XDEB_OPT_WARN_CONFLICT=true
#export XDEB_OPT_FIX_CONFLICT=true

##################################
########## TEST MIRRORS ##########
##################################

# PATH.
#export PATH=$HOME/bin:$PATH
