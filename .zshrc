# antigen
source ~/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh

antigen_plugins=( \
  git \
    command-not-found \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-completions \
    golang \
    cabal \
    brew \
    brew-cask)
for p in $antigen_plugins; do
  antigen bundle $p
done

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
RPROMPT='$(git_prompt_info)[$prompt_user]' # XXX: single quote
SPROMPT="%F{yellow}Did you mean%f %B%F{yellow}%r%f%b %F{yellow}? \
[y(yes),n(no),a(abort),e(edit)]%f %F{white}>%f "

setopt transient_rprompt

# zsh option
bindkey -e

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export WORKSPACE=$HOME/work
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

setopt auto_pushd
setopt append_history
setopt auto_menu
setopt auto_param_slash
setopt pushd_ignore_dups
setopt list_packed
setopt hist_ignore_dups
setopt correct
setopt no_correct_all

# appearance
export TERM=xterm-256color

# editor settings
export ALTERNATE_EDITOR="" # for emacs server
export EDITOR="emacsclient -t"
export GIT_EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"

alias e="emacsclient -t"
alias v="vim"
alias vi="vim"

# alias
alias la="ls -la"
alias platex="platex -kanji=utf8 -shell-escape"

# PATH
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/sbin:/sbin:$PATH

# load inits
ZSH_INITS=$HOME/.zsh/inits

source $ZSH_INITS/lang.zsh
source $ZSH_INITS/functions.zsh
source $ZSH_INITS/os_switch.zsh
source $ZSH_INITS/host_switch.zsh

# run tmux
source $ZSH_INITS/tmux.zsh
