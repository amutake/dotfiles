# switching by os
case ${OSTYPE} in
  darwin*)
    alias ls="ls -G"
    ;;
  linux*)
    alias ls="ls --color"
    export LSCOLORS=gxfxcxdxbxegedabagacad
    if [[ -d ~/.linuxbrew ]]; then
      export PATH=$HOME/.linuxbrew/bin:$PATH
    fi
    export LANG=en_US.UTF-8
    ;;
esac
