#!/bin/bash

cwd=$(cd $(dirname $0); pwd)

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle
