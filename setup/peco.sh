#!/bin/bash

kernel=$(uname | awk '{print tolower($0)}')
case $(arch) in
  x86_64 | amd64 )
    arch="amd64"
    ;;
  i386 | i686 | x86 )
    arch="386"
    ;;
  *)
    exit 1
    ;;
esac

tmpdir=$(mktemp -d -t peco)
cd $tmpdir
dirname="peco_${kernel}_${arch}"
tag=$(curl -sI https://github.com/peco/peco/releases/latest | awk -F'/' '/^Location:/{print $NF}' | tr -d '\r')
wget https://github.com/peco/peco/releases/download/${tag}/${dirname}.zip
unzip ${dirname}.zip
mv ${dirname}/peco ~/.local/bin/peco
rm -r ${tmpdir}
