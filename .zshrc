# PREREQUISITE
# ------------
#
# - install [zplug](https://github.com/zplug/zplug) into $HOME/.zplug/
# - install [pure](https://github.com/sindresorhus/pure) via npm

# plugin management using zplug
# -----------------------------
if [[ ! -d $HOME/.zplug ]]; then
  echo "======================================================================="
  echo "Directory $HOME/.zplug not found."
  echo "See the .zshrc PREREQUISITE section and"
  echo "install zplug (https://github.com/zplug/zplug) first!"
  echo "======================================================================="
  return
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2 # load after compinit
zplug "zsh-users/zsh-completions"
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "amutake/deco.zsh"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# completion
# ----------
autoload -Uz compinit
compinit
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'm:{a-zA-Z}={A-Za-z} r:|[._-]=* r:|=*' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*'

# colors
# ------
#
# enables you to use ${fg[color]}, ${bg[color]}, $reset_color, etc
#  e.g., `echo "${fg[blue]}blue\!${reset_color}"` prints blue "blue"
autoload -Uz colors
colors

# prompt
# ------
#
# using [pure](https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure
setopt transient_rprompt # show rprompt only current line

# key binding
# -----------
bindkey -e
bindkey '^W' kill-region
function copy-region() {
  zle copy-region-as-kill
  REGION_ACTIVE=0
}
zle -N copy-region
bindkey '^[w' copy-region

# zsh options
# -----------
setopt auto_pushd
setopt append_history
setopt share_history
setopt auto_menu
setopt auto_param_slash
setopt auto_param_keys
setopt pushd_ignore_dups
setopt list_packed
setopt hist_ignore_dups
setopt correct
setopt no_correct_all

# exports
# -------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# all non-alphabetric characters are delimiters
WORDCHARS=''

# aliases
# -------
alias e="emacsclient -t"
alias v="vim"
alias vi="vim"
alias la="ls -la"

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

export PATH=$HOME/.local/bin:$PATH # to priotize ~/.local/bin

# run tmux or after-rc-commands
if [[ -z $AFTER_RC ]]; then
  source $ZSH_INITS/tmux.zsh
else
  eval "$AFTER_RC"
fi
