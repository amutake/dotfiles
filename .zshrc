autoload -U compinit promptinit
compinit
promptinit

autoload -Uz colors
colors

PROMPT="%{${fg[green]}%}%B%n%b%{${reset_color}%}%{${fg[magenta]}%}@%{${reset_color}%}%{${fg[green]}%}%B%c%b%{${reset_color}%} %B%#%b "
RPROMPT="%F{magenta}[%D %*]%f"

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

export GIT_EDITOR="emacs -nw"

alias e="emacs -nw"
alias ls="ls --color"
alias platex="platex -kanji=utf8 -shell-escape"

PATH=$HOME/.cabal/bin:$HOME/.cabal-dev/bin:$PATH

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
