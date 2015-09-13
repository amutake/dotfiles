# autoload functions

fpath=($HOME/.zsh/functions $fpath)
if type peco >/dev/null; then
  autoload -Uz pk # peco-kill-process
  autoload -Uz ph # peco-select-history
  zle -N ph
  bindkey '^R' ph
  autoload -Uz pc # peco-git-repo-change-directory
  autoload -Uz pd # peco-change-directory-by-fasd
fi
