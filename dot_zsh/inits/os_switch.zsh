# switching by os
case ${OSTYPE} in
  darwin*)
    export PATH=/Library/TeX/texbin:$PATH
    # coreutils. for more information, `brew info coreutils`
    if [[ -d /usr/local/opt/coreutils ]]; then
      export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
      export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
      alias ls="ls --color"
      export LSCOLORS=gxfxcxdxbxegedabagacad
    else
      alias ls="ls -G"
    fi
    # gnu-sed (which is not included in coreutils package). for more information, `brew info gnu-sed`
    if [[ -d /usr/local/opt/gnu-sed ]]; then
      export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
      export MANPATH=/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH
    fi
    export GPG_TTY=$(tty)
    ;;
  linux*)
    alias ls="ls --color"
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LANG="en_US.UTF-8"
    export LANGUAGE="en_US:en"
    export LC_ALL="en_US.UTF-8"
    unset MAILCHECK
    export GPG_TTY=$(tty)
    ;;
esac
