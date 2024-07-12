# asdf
if [ -d $HOME/.asdf ]; then
    local plugins="$HOME/.asdf/plugins"
    # java
    if [ -d $plugins/java ]; then
        . $plugins/java/set-java-home.zsh
    fi
fi

# mise
if type $HOME/.local/bin/mise > /dev/null 2>&1; then
    eval "$(~/.local/bin/mise activate zsh)"
fi

# ocaml
if [ -d $HOME/.opam ]; then
    . $HOME/.opam/opam-init/init.zsh >/dev/null 2>&1 || true
fi

# rust
if [ -d $HOME/.cargo ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

# go
if type go > /dev/null 2>&1; then
    export GOPATH=$HOME/work/go
    export PATH=$GOPATH/bin:$PATH
fi

# docker
if [ -d $HOME/.docker ]; then
    export PATH=$HOME/.docker/bin:$PATH
fi
