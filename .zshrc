
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="typewritten/typewritten"
export TYPEWRITTEN_DISABLE_RETURN_CODE=true
export TYPEWRITTEN_PROMPT_LAYOUT="pure_verbose"

plugins=(git)

export BROWSER="/usr/bin/firefox"

source $ZSH/oh-my-zsh.sh

wal -r && clear

dotcfg () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

alias spt="$HOME/.custom-scripts/spotify.sh"
#alias ssh="TERM=xterm-256color ssh"

# OFF by default: shell editor wm de palette

export PF_INFO="ascii title os host kernel uptime pkgs memory palette editor"

pfetch

clear && cat /home/oriely/.cache/wal/sequences

pfetch
