#!/bin/zsh

dotfiles=${0:a:h}

# Create a symlink at location $1 with source $2. Backup $1 if it already
# exists.
backup-and-link() {
  [ -z "$2" ] && return 1

  if [ -e "$1" ]; then
    echo "Moved $1 -> $1.back"
    mv "$1" "$1".back
  fi

  ln -s "$2" "$1"
  echo "Symlinked $1 -> $2"
}

# Link dotfiles.
backup-and-link ~/.zsh       "$dotfiles"/files/.zsh
backup-and-link ~/.zshrc     "$dotfiles"/files/.zshrc
backup-and-link ~/.tmux.conf "$dotfiles"/files/.tmux.conf
backup-and-link ~/.editrc    "$dotfiles"/files/.editrc
backup-and-link ~/.inputrc   "$dotfiles"/files/.inputrc
backup-and-link ~/.gitignore "$dotfiles"/files/.gitignore
backup-and-link ~/.gitconfig "$dotfiles"/files/.gitconfig
