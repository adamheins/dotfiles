#!/bin/bash

# Install brew package manager.

if command -v brew >/dev/null 2>&1; then
  echo "brew already installed."
else
  if [ $(uname) = "Darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

