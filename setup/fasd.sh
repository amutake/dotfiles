#!/bin/bash

version=1.0.1

tmpdir=$(mktemp -d -t fasd.XXX)
cd $tmpdir
wget https://github.com/clvv/fasd/archive/${version}.tar.gz
tar xf ${version}.tar.gz
cd fasd-${version}
PREFIX=$HOME/.local make install
rm -r ${tmpdir}
