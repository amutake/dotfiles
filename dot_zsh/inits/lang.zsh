# ocaml
if [ -d $HOME/.opam ]; then
    . $HOME/.opam/opam-init/init.zsh >/dev/null 2>&1 || true
fi

# rust
if [ -d $HOME/.cargo ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

# go
if [ -d $HOME/work/go ]; then
    export GOPATH=$HOME/work/go
fi

# asdf
if [ -d $HOME/.asdf ]; then
    local plugins="$HOME/.asdf/plugins"
    # java
    if [ -d $plugins/java ]; then
        . $plugins/java/set-java-home.zsh
    fi
fi

# docker
if [ -d $HOME/.docker ]; then
    export PATH=$HOME/.docker/bin:$PATH
fi

# mise
if type $HOME/.local/bin/mise > /dev/null 2>&1; then
    eval "$(~/.local/bin/mise activate zsh)"
fi
