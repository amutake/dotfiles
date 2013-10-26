autoload -U compinit promptinit
compinit
promptinit

autoload -Uz colors
colors

local prompt_user="%F{green}%B%n%b%f"
local prompt_at="%F{magenta}@%f"
local prompt_host="%F{green}%B%m%b%f"
local prompt_colon="%F{magenta}:%f"
local prompt_dir="%F{green}%B%c%b%f"
local prompt_mark=" %B%#%b "
PROMPT="$prompt_user$prompt_at$prompt_host$prompt_colon$prompt_dir$prompt_mark"
# RPROMPT="%F{magenta}[%D %*]%f"

bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export LANG=ja_JP.UTF-8

setopt auto_pushd
setopt append_history
setopt auto_menu
setopt auto_param_slash
setopt pushd_ignore_dups
setopt list_packed
setopt hist_ignore_dups

# appearance
export TERM=xterm-256color

# editor settings
export GIT_EDITOR="vim"

alias e="emacs -nw"
alias v="vim"
alias vi="vim"



alias platex="platex -kanji=utf8 -shell-escape"

# cabal
export PATH=$HOME/.cabal/bin:$PATH

# PATH
# ~/.local --- bin    binary files
#           |
#           |- sh     shell scripts
#           |
#           |- share  config files
export PATH=$HOME/.local/bin:$HOME/.local/sh:/usr/local/bin:$PATH


case ${OSTYPE} in
    darwin*)
        alias ls="ls -G"
        PATH=$(brew --prefix ruby)/bin:$PATH
        ;;
    linux*)
        alias ls="ls --color"
        export LSCOLORS=gxfxcxdxbxegedabagacad
        ;;
esac

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi
