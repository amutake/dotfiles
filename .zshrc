# antigen
source ~/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen apply

# completion
autoload -U compinit promptinit
compinit -u # not secure...
promptinit


# prompt
autoload -Uz colors
colors

ZSH_THEME_GIT_PROMPT_PREFIX="[%F{yellow}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%f]"

local prompt_user="%F{green}%n%f%F{white}@%f%F{green}%m%f"

PROMPT="%F{green}%c%f %F{white}%#%f "
RPROMPT="$(git_prompt_info)[$prompt_user]"
SPROMPT="%F{yellow}Did you mean%f %B%F{yellow}%r%f%b %F{yellow}? \
[y(yes),n(no),a(abort),e(edit)]%f %F{white}>%f "

# setopt transient_rprompt

# zsh option
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
setopt correct

# appearance
export TERM=xterm-256color

# editor settings
export GIT_EDITOR="vim"

alias e="emacs -nw"
alias v="vim"
alias vi="vim"


# alias
alias la="ls -la"
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
