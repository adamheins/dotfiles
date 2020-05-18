#!/bin/zsh

scriptpath=${0:a:h}

# Link dotfiles.

ln -s "$scriptpath"/files/.zsh ~/.zsh
ln -s "$scriptpath"/files/.zshrc ~/.zshrc
ln -s "$scriptpath"/files/.gitignore ~/.gitignore
ln -s "$scriptpath"/files/.tmux.conf ~/.tmux.conf
ln -s "$scriptpath"/files/.editrc ~/.editrc
ln -s "$scriptpath"/files/.inputrc ~/.inputrc

echo Created symlinks.

# Generate the global git config file.

[ -f ~/.gitconfig ] && rm ~/.gitconfig

git config --global push.default "simple"
git config --global user.name "Adam Heins"
git config --global user.email "mail@adamheins.com"
git config --global core.excludesfile $HOME/.gitignore
git config --global diff.tool "vimdiff"
git config --global difftool.prompt "false"
git config --global url."git@github.com:".insteadOf "https://github.com/"

echo Created ~/.gitconfig
