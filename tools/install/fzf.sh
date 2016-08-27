#!/bin/sh

FZF_INSTALL_PATH=/usr/local/opt/fzf

ruby_location="$(which ruby)"

# fzf depends on ruby, and building the required gems also depends on ruby-dev.
if [ ! $ruby_location ]; then
  echo "Error: ruby is not installed."
  echo "Make sure you also install ruby-dev."
  echo "Aborting."
  exit 1
fi

# Ruby gem dependencies.
gem install curses

# Create directory for fzf if it doesn't exist.
if [ ! -d "$FZF_INSTALL_PATH" ]; then
  sudo mkdir -p /usr/local/opt/fzf
fi

# Change ownership of the directory to current user.
sudo chown -R $(whoami) "$FZF_INSTALL_PATH"

# Clone fzf into the install directory.
git clone https://github.com/junegunn/fzf.git "$FZF_INSTALL_PATH"

# Move fzf binary into the bin directory.
mv "$FZF_INSTALL_PATH"/fzf "$FZF_INSTALL_PATH"/bin
