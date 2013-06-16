#!/bin/bash

DOT_FILES=(.tmux.conf .zshrc .emacs.d)

for file in ${DOT_FILES[@]}
do
    if [ -L $HOME/$file ]; then
        echo "symlink exist: $file"
    elif [ -d $HOME/$file ]; then
        echo "dir exist: $file"
    elif [ -f $HOME/$file ]; then
        echo "file exist: $file"
    else
        ln -s $HOME/.dotfiles/$file $HOME/$file
        echo "set: $file"
    fi
done
