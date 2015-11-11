#!/bin/bash

cd ~
if [ -d .rbenv ]; then
  echo "rbenv is already installed"
else
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo "rbenv is successfully installed"
fi
mkdir -p .rbenv/plugins
if [ -d .rbenv/plugins/ruby-build ]; then
  echo "ruby-build is already installed"
else
  git clone git://github.com/sstephenson/ruby-build.git .rbenv/plugins/ruby-build
  echo "ruby-build is successfully installed"
fi

export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

echo "Is it ok to install ruby? (Have you installed dependencies?)"
echo "See: https://github.com/sstephenson/ruby-build/wiki"
read -p "[y/N] " yN
if [[ $yN = "y" || $yN = "Y" ]]; then
  if type peco >/dev/null; then
    rbenv install -l | peco | xargs rbenv install
  else
    rbenv install -l
    echo -n "version> "
    read version
    rbenv install $version
  fi
  echo "install finished. to use installed version of ruby, run 'rbenv global x.x.x'"
else
  echo "done"
fi
