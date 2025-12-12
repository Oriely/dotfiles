# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.local/bin

# User Configuration

alias pacins="sudo pacman -S"
alias p='sudo pacman'
alias pu='sudo pacman -Syu'
alias pa='sudo pacman -Sy'
alias pq='sudo pacman -Q'

alias dotcfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ssh='TERM=xterm ssh'


fastfetch

#if uwsm check may-start; then
#    exec uwsm start hyprland-uwsm.desktop
#fi
