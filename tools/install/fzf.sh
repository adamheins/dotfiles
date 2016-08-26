#!/bin/sh

FZF_INSTALL_PATH=/usr/local/opt/fzf

# Create directory for fzf if it doesn't exist.
if [ ! -d "$FZF_INSTALL_PATH" ]; then
  sudo mkdir /usr/local/opt/fzf
fi

# Change ownership of the directory to current user.
sudo chown -R $(whoami) "$FZF_INSTALL_PATH"

# Clone fzf into the install directory.
git clone https://github.com/junegunn/fzf.git "$FZF_INSTALL_PATH"

# Move fzf binary into the bin directory.
mv "$FZF_INSTALL_PATH"/fzf "$FZF_INSTALL_PATH"/bin
