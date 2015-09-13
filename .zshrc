# antigen
source ~/.zsh/antigen/antigen.zsh

antigen bundles <<EOF
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
EOF

antigen apply

# completion
autoload -Uz compinit
compinit

# colors
# enables you to use ${fg[color]}, ${bg[color]}, $reset_color, etc
#  e.g., `echo "${fg[blue]}blue\!${reset_color}"` prints blue "blue"
autoload -Uz colors
colors

# prompt
autoload -Uz promptinit
promptinit
prompt adam2
setopt transient_rprompt # show rprompt only current line

# zsh option
bindkey -e

setopt auto_pushd
setopt append_history
setopt auto_menu
setopt auto_param_slash
setopt auto_param_keys
setopt pushd_ignore_dups
setopt list_packed
setopt hist_ignore_dups
setopt correct
setopt no_correct_all

# exports
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export TERM=xterm-256color
export WORKSPACE=$HOME/work
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/sbin:/sbin:$PATH

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

if type fasd >/dev/null; then
  eval "$(fasd --init auto)"
  alias fe='fasd -f -e "emacsclient -t"'
fi

# load init files
ZSH_INITS=$HOME/.zsh/inits

source $ZSH_INITS/lang.zsh
source $ZSH_INITS/functions.zsh
source $ZSH_INITS/os_switch.zsh
source $ZSH_INITS/host_switch.zsh

# run tmux
source $ZSH_INITS/tmux.zsh
