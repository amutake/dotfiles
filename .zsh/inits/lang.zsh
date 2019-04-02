# direnv
if type direnv >/dev/null; then
  eval "$(direnv hook zsh)"
fi

# haskell
if [ -d $HOME/.ghcup ]; then
  source $HOME/.ghcup/env
fi

# ruby
if [ -d $HOME/.rbenv ]; then
  export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
  eval "$(rbenv init -)"
fi

# ocaml
if [ -d $HOME/.opam ]; then
  eval `opam config env`
  . $HOME/.opam/opam-init/init.zsh >/dev/null 2>&1 || true
  export OCAMLPARAM="_,bin-annot=1"
  export OPAMKEEPBUILDDIR=1
fi

# golang
if type go >/dev/null; then
  mkdir -p $WORKSPACE/go
  export GOPATH=$WORKSPACE/go
  export PATH=$GOPATH/bin:$PATH
fi

# python
case ${OSTYPE} in
  darwin*)
    local python_version=`python -c "import sys; print(\"%s.%s\" % sys.version_info[:2])"`
    local python_user_dir=$HOME/Library/Python/$python_version
    export PATH=$python_user_dir/bin:$PATH
    ;;
esac

# coq
if type coqc >/dev/null; then
  alias coq_make="coq_makefile -f Make -o Makefile"
fi

# rust
if [ -d $HOME/.cargo ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi
if type racer >/dev/null && [[ -d ~/.local/share/rust/src ]]; then
  export RUST_SRC_PATH=$PATH/.local/share/rust/src
fi

# erlang
if [ -d $HOME/.erlenv ]; then
  export PATH=$HOME/.erlenv/bin:$HOME/.erlenv/shims:$PATH
  eval "$(erlenv init -)"
fi

# flutter
if [ -d $HOME/flutter ]; then
  export PATH=$HOME/flutter/bin:$PATH
fi
