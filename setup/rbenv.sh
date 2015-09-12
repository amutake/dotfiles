#!/bin/bash

cd ~
git clone git://github.com/sstephenson/rbenv.git .rbenv
mkdir -p .rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"
echo "rbenv is successfully installed"

echo "Is it ok to install ruby? (Have you installed dependencies?)"
echo "See: https://github.com/sstephenson/ruby-build/wiki"
echo -n "[y/N] "
read yN
if [[ yN = "y" || yN = "Y" ]]; then
  if type peco >/dev/null; then
    rbenv install -l | peco | xargs rbenv install
  else
    rbenv install -l
    echo -n "version> "
    read version
    rbenv install $version
  fi
else
  echo "done"
fi
