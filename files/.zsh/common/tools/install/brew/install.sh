#!/bin/bash

if [ $(uname) = "Darwin" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Only install brew on macOS!"
fi
