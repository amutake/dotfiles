# peco
if type peco >/dev/null; then
  while-read() {
    while read LINE; do $@ $LINE; done
  }
  # ghq cd
  c() {
    ghq list -p | peco --query="$*" | while-read cd
    echo -n "pwd: "
    pwd
  }
  # find cd
  fc() {
    find . -type d -name "*${1}*" | peco --query=$1 | while-read cd
  }
  # ghq git cd
  ggc() {
    ggc-internal() {
      for dir in $(ghq list -p); do
        cd $dir
        for d in $(git ls-tree -d -r --name-only HEAD); do
          echo $dir"/"$d
        done
      done
    }
    dir=$(ggc-internal | peco --query="$*")
    if [ "$dir" != "" ]; then
      cd $dir
      echo -n "pwd: "
      pwd
    fi
    unset d
    unset dir
  }
  # find emacs
  fe() {
    file=$(find . -type f -name "*${1}*" | peco --query="$*")
    if [ "$file" != "" ]; then
      e $file
    fi
  }
  # git emacs
  ge() {
    file=$(git ls-files | peco --query="$*")
    if [ "$file" != "" ]; then
      e $file
    fi
  }
  # ghq git emacs
  gge() {
    gge-internal() {
      for dir in $(ghq list -p); do
        cd $dir
        for file in $(git ls-files); do
          echo $dir"/"$file;
        done
      done
    }
    file=$(gge-internal | peco --query="$*")
    if [ "$file" != "" ]; then
      e $file
    fi
    unset dir
    unset file
  }
  # process kill
  pk() {
    ps ax -o pid,lstart,command | peco --query="$LBUFFER" | awk '{print $1}' | xargs kill
  }
fi
