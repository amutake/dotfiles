#!/bin/bash

DOT_FILES=(.tmux.conf)

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        echo "file exist: $file"
    else
        ln -s $HOME/.dotfiles/$file $HOME/$file
        echo "set: $file"
    fi
done
