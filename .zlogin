if ! [[ -z ${SSH_CLIENT+x} ]]; then
  if type toilet >/dev/null; then
    toilet -f smbraille -F border -F gay $(hostname -s)
  elif type screenfetch >/dev/null; then
    screenfetch
  else
    message=" Welcome to $(hostname -s)! "
    len=${#message}
    tl="┌"
    tr="┐"
    h="─"
    v="│"
    bl="└"
    br="┘"
    printf "$tl"; repeat $len printf "$h"; print "$tr"
    printf "$v"; printf "$message"; print "$v"
    printf "$bl"; repeat $len printf "$h"; print "$br"
  fi
fi
