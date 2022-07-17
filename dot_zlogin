if ! [[ -z ${SSH_CLIENT+x} ]]; then
  if type toilet >/dev/null; then
    toilet -f smbraille -F border -F gay $(hostname -s)
  elif type screenfetch >/dev/null; then
    screenfetch
  else
    border "Welcome to $(hostname -s)!"
  fi
fi
