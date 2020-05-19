#!/bin/zsh

dotfiles=${0:a:h}


# Create a symlink at location $1 with source $2. Backup $1 if it already
# exists.
backup-and-link() {
  [ -z "$2" ] && return 1

  if [ -e "$1" ]; then
    echo "$1" exists; moving to "$1".back
    mv "$1" "$1".back
  fi

  ln -s "$2" "$1"
  echo Created symlink "$1 -> $2"
}

# Link dotfiles.

backup-and-link ~/.zsh       "$dotfiles"/files/.zsh
backup-and-link ~/.zshrc     "$dotfiles"/files/.zshrc
backup-and-link ~/.gitignore "$dotfiles"/files/.gitignore
backup-and-link ~/.tmux.conf "$dotfiles"/files/.tmux.conf
backup-and-link ~/.editrc    "$dotfiles"/files/.editrc
backup-and-link ~/.inputrc   "$dotfiles"/files/.inputrc

# Generate the global git config file.

if [ -f ~/.gitconfig ]; then
  echo ~/.gitconfig exists; moving to ~/.gitconfig.back
  mv ~/.gitconfig ~/.gitconfig.back
fi

git config --global push.default "simple"
git config --global user.name "Adam Heins"
git config --global user.email "mail@adamheins.com"
git config --global core.excludesfile $HOME/.gitignore
git config --global diff.tool "vimdiff"
git config --global difftool.prompt "false"
git config --global url."git@github.com:".insteadOf "https://github.com/"

echo Created ~/.gitconfig
