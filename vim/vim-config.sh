#!/bin/bash

# Set up vim configuration and plugins.
cd $(dirname $0)
cp -r .vim/ ~/.vim
cp .vimrc ~/.vimrc
~/.vim/install-plugins.sh
