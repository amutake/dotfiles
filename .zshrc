# antigen
source ~/.zsh/antigen/antigen.zsh

antigen bundles <<EOF
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions
robbyrussell/oh-my-zsh plugins/ssh-agent
mafredri/zsh-async
sindresorhus/pure
EOF

antigen apply

# antigen util
antigen-plugin-dir() {
  echo $(-antigen-get-clone-dir $(-antigen-resolve-bundle-url $1))
}

# completion
autoload -Uz compinit
compinit

# colors
# enables you to use ${fg[color]}, ${bg[color]}, $reset_color, etc
#  e.g., `echo "${fg[blue]}blue\!${reset_color}"` prints blue "blue"
autoload -Uz colors
colors

# prompt
# The below code is workaround for combination of pure and antigen.
# This may be fixed in the future.
if [[ ! -L ~/.zsh/functions/prompt_pure_setup ]]; then
  ln -s $(antigen-plugin-dir sindresorhus/pure)/pure.zsh ~/.zsh/functions/prompt_pure_setup
fi
autoload -Uz promptinit
promptinit
prompt pure
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

# all non-alphabetric characters are delimiters
WORDCHARS=''

# alias
alias e="emacsclient -t"
alias v="vim"
alias vi="vim"
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
