#!/bin/sh

symdir=~/.vim/after/plugin
sympath=$symdir/aliases.vim
filepath=~/.vim/aliases.vim

mkdir -p $symdir
[ -f $sympath ] && rm $sympath
ln -s $filepath $sympath
