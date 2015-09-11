#!/bin/bash

dotfiles=(.tmux.conf .tmux .zshrc .zsh .emacs.d .vimrc .vim .gitconfig)
scripts=$(ls scripts)

cwd=$(dirname "${0}")
cwd=$(cd $cwd && pwd)

label="$(tput setaf 86)[setup]$(tput sgr0)"

# functions of each command

run_help() {
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
}

run_install() {
    echo "$label symboric link setting..."
    for file in ${dotfiles[@]}; do
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
    for file in ${scripts[@]}; do
        if [ -L $HOME/.local/bin/$file ]; then
            echo "  symlink exists: $file"
        elif [ -f $HOME/$file ]; then
            echo "  file exists: $file"
        else
            ln -s $cwd/scripts/$file $HOME/.local/bin/$file
            echo "  set: $file"
        fi
    done
    echo "$label submodule updating..."
    git submodule init
    git submodule update
    echo "$label done."
}

run_uninstall() {
    echo "$label uninstalling..."
    for file in ${dotfiles[@]}; do
        if [ -L $HOME/$file ]; then
            linkpath=`readlink -n $HOME/$file`
            if [ "$linkpath" = "$cwd/$file" ]; then
                rm $HOME/$file
                echo "  unlink: $file"
            fi
        fi
    done
    for file in ${scripts[@]}; do
        if [ -L $HOME/.local/bin/$file ]; then
            linkpath=`readlink -n $HOME/.local/bin/$file`
            if [ "$linkpath" = "$cwd/scripts/$file" ]; then
                rm $HOME/.local/bin/$file
                echo "  unlink: $file"
            fi
        fi
    done
    echo "$label done."
}

run_update() {
    echo "$label updating..."
    git pull
    git submodule update
    echo "done."
}

run_clean() {
    git clean -n -d -X
    echo -n "$label These files would be removed. ok? [y/N] "
    read ok
    if [ "$ok" = "y" -o "$ok" = "Y" ]; then
        echo "$label cleaning..."
        git clean -f -d -X
        echo "$label done."
    else
        echo "$label abort."
    fi
}

# main

case $1 in
    help)
        run_help
        ;;
    install)
        run_install
        ;;
    uninstall)
        run_uninstall
        ;;
    update)
        run_update
        ;;
    clean)
        run_clean
        ;;
    *)
        echo "Usage: setup.sh <help|install|uninstall|update|clean>"
        ;;
esac
