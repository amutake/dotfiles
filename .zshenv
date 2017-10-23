fpath=($HOME/.zsh/functions /usr/local/share/zsh/site-functions $fpath)
export PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export TERM=xterm-256color
export WORKSPACE=$HOME/work
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# editor settings
export ALTERNATE_EDITOR="" # for emacs server
export EDITOR="emacsclient -t"
export GIT_EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
