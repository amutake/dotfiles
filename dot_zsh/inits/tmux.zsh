# tmux (create or attach session)
if [ -z "$TMUX" ] && type tmux >/dev/null; then
  if tmux has-session; then
    if type peco >/dev/null; then
      # local name=$(tmux ls | gsed '$a\new-session: create new session' | peco --prompt "TMUX-SESSION>" | awk -F':' '{print $1}')
      # if [[ "$name" == "new-session" ]]; then
      #   tmux new
      # elif [ -n "$name" ]; then
      #   tmux a -t $name
      # fi
    else
      if read -q "?$(tput setaf 2)[tmux]$(tput sgr0) Is it OK to attach the last session?: (y/N) "; then
        tmux attach
      elif echo "" && read -q "?$(tput setaf 2)[tmux]$(tput sgr0) Is it OK to create new session?: (y/N) "; then
        tmux new
      else
        echo "" && echo 'If you want to attach manually, select session name by `tmux ls` and attach by `tmux a -t {name}`.'
      fi
    fi
  else
    tmux new -s tmux
  fi
fi
