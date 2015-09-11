# switching by os
case ${OSTYPE} in
  darwin*)
    alias ls="ls -G"
    ;;
  linux*)
    alias ls="ls --color"
    export LSCOLORS=gxfxcxdxbxegedabagacad
    ;;
esac
