#!/bin/bash

# Clone each git repo specified in the repos.txt file into the .vim/bundle
# folder, to be loaded as vim plugins by pathogen.

dir=${1:-"$(echo ~/.vim/bundle)"}
echo "Placing repos into $dir..."

# Create the destination parent directory if it doesn't exist, then cd to it.
if [ ! -d "$dir" ]; then
  mkdir "$dir"
fi
cd "$dir" || exit 1

# Clone the repos.
while read repo; do
  git clone $repo
done <~/.vim/repos.txt

echo "Done."
