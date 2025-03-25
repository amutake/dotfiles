# autoload functions

if type fzf >/dev/null; then
  autoload -Uz pk # fzf-kill-process
fi

autoload -Uz border # wrap text by border
autoload -Uz tempspace # enter temporary space
autoload -Uz sshpi # convinient script to ssh local pi
