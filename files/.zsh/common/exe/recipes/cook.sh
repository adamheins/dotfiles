#!/bin/sh

# Install core items. Use caution, as this will overwrite existing files with
# the same name.
if [ -d core ]; then
  sudo cp core/* /usr/local/bin
fi
