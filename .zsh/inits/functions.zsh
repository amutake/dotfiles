# autoload functions

fpath=($HOME/.zsh/functions $fpath)
if type peco >/dev/null; then
  autoload -Uz pk
fi
