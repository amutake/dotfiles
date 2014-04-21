#!/bin/bash

DOT_FILES=(.tmux.conf .zshrc .zsh .emacs.d .vimrc .vim .coqrc .gitconfig)
SCRIPTS=`ls scripts`

cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

if [ "$1" = "help" ]; then
  echo "Dotfiles setup script"
  echo ""
  echo "Usage: setup.sh <command>"
  echo ""
  echo "Commands:"
  echo "  help           Show this help text"
  echo "  install        Install dotfiles"
  echo "  uninstall      Uninstall dotfiles"
  echo "  update         Update dotfiles"
  echo "  clean          Clean plugins"
elif [ "$1" = "install" ]; then
  echo "symboric link setting..."
  for file in ${DOT_FILES[@]}
  do
    if [ -L $HOME/$file ]; then
      echo "  symlink exists: $file"
    elif [ -d $HOME/$file ]; then
      echo "  dir exists: $file"
    elif [ -f $HOME/$file ]; then
      echo "  file exists: $file"
    else
      ln -s $cwd/$file $HOME/$file
      echo "  set: $file"
    fi
  done
  mkdir -p $HOME/.local/bin
  for file in ${SCRIPTS[@]}
  do
    if [ -L $HOME/.local/bin/$file ]; then
      echo "  symlink exists: $file"
    elif [ -f $HOME/$file ]; then
      echo "  file exists: $file"
    else
      ln -s $cwd/scripts/$file $HOME/.local/bin/$file
      echo "  set: $file"
    fi
  done
  echo "submodule updating..."
  git submodule init
  git submodule update
  echo "done."
elif [ "$1" = "uninstall" ]; then
  echo "uninstalling..."
  for file in ${DOT_FILES[@]}
  do
    if [ -L $HOME/$file ]; then
      linkpath=`readlink -n $HOME/$file`
      if [ "$linkpath" = "$cwd/$file" ]; then
        rm $HOME/$file
        echo "  rm: $file"
      fi
    fi
  done
  for file in ${SCRIPTS[@]}
  do
    if [ -L $HOME/.local/bin/$file ]; then
      linkpath=`readlink -n $HOME/.local/bin/$file`
      if [ "$linkpath" = "$cwd/scripts/$file" ]; then
        rm $HOME/.local/bin/$file
        echo "  rm: $file"
      fi
    fi
  done
  echo "done."
elif [ "$1" = "update" ]; then
  echo "updating..."
  git pull
  git submodule update
  echo "done."
elif [ "$1" = "clean" ]; then
  git clean -n -d -X
  echo -n "ok? [y/n] "
  read ok
  if [ "$ok" = "y" ]; then
    echo "cleaning..."
    git clean -f -d -X
    echo "done."
  else
    echo "abort."
  fi
else
  echo "Usage: setup.sh <help|install|uninstall|update|clean>"
fi
