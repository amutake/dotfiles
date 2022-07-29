# ocaml
if [ -d $HOME/.opam ]; then
  . $HOME/.opam/opam-init/init.zsh >/dev/null 2>&1 || true
fi

# rust
if [ -d $HOME/.cargo ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi
