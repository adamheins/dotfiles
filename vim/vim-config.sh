#!/bin/bash

# Set up vim configuration and plugins.
cp -r .vim/ ~/.vim
cp vim/.vimrc ~/.vimrc
./~/.vim/install-repos.sh
