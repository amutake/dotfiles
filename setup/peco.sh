#!/bin/bash

kernel=$(uname | awk '{print tolower($0)}')
case $(arch) in
  x86_64|amd64)
    arch="amd64"
    ;;
  i386|i686|x86)
    arch="386"
    ;;
  *)
    exit 1
    ;;
esac

tmpdir=$(mktemp -d -t peco.XXX)
cd $tmpdir
dirname="peco_${kernel}_${arch}"
case ${kernel} in
  darwin|windows)
    ext=".zip"
    ;;
  linux)
    ext=".tar.gz"
    ;;
esac
tag=$(curl -sI https://github.com/peco/peco/releases/latest | awk -F'/' '/^Location:/{print $NF}' | tr -d '\r')
wget https://github.com/peco/peco/releases/download/${tag}/${dirname}${ext}
if [[ $ext = ".zip" ]]; then
  unzip ${dirname}${ext}
else
  tar xf ${dirname}${ext}
fi
mv ${dirname}/peco ~/.local/bin/peco
rm -r ${tmpdir}
