#!/bin/bash

dotfiles=(.tmux.conf .tmux .zshrc .zsh .emacs.d .vimrc .vim .gitconfig)
scripts=$(ls scripts)

cwd=$(dirname "${0}")
cwd=$(cd $cwd && pwd)

colored() {
    echo "$(tput setaf 86)$1$(tput sgr0)"
}
label=$(colored "[setup]")

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
    echo "  upgrade [all]  Upgrade submodule"
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
    if [[ $OSTYPE =~ "darwin" ]]; then
        echo -n "$label Are you ok to run \`brew bundle\`? (y/N) "
        read ok
        if [[ $ok = "y" || $ok = "Y" ]]; then
            pushd brew >/dev/null
            ./install.sh
            popd >/dev/null
        fi
    fi
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
    echo "$label dotfiles updating..."
    git pull
    echo "$label submodules updating..."
    git submodule update
    echo "$label done."
}

run_upgrade() {
    local opt=$1
    local submodules=($(git submodule status | awk '{print $2}'))
    if [[ "$opt" = "all" ]]; then
        echo -n "$label Would upgrade all submodules. ok? (y/N) "
        read ok
        if [[ "$ok" = "y" || "$ok" = "Y" ]]; then
            git submodule foreach git pull origin master
            echo "$label done."
        else
            echo "$label abort."
        fi
    else
        echo "$label Please choose which submodule you want to upgrade:"
        for i in $(seq 0 $((${#submodules[@]} - 1))); do
            echo "  $i: ${submodules[$i]}"
        done
        echo -n "$(colored "number>") "
        read n
        target=${submodules[$n]}
        if [[ -n "$target" ]]; then
            cd $target
            git pull origin master
            echo "$label done."
        else
            echo "$label Please select from (0..$((${#submodules[@]} - 1))). abort."
        fi
    fi
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
    upgrade)
        run_upgrade $2
        ;;
    clean)
        run_clean
        ;;
    *)
        echo "Usage: setup.sh <help|install|uninstall|update|upgrade[all]|clean>"
        ;;
esac
