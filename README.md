# ~/.\*
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users. The dotfiles themselves are located in the `files` directory.

## Setup
You need to be using zsh to make use of these dotfiles. Change your shell using
the following command:
```bash
chsh -s /bin/zsh
```
Then restart your shell session.

## Install
Get set up with these dotfiles:
```bash
git clone --recursive git@github.com:adamheins/dotfiles ~/.dotfiles
cd ~/.dotfiles
./dotfiler.py
```
The dotfiler.py script backs up all of the local machine's current dotfiles and
then creates symlinks to the dotfiles in this repo.

## Add a dotfile
1. Move the dotfile from its current location to `~/.dotfiles/files/`.
2. Add the file to the links.json file.
3. Run the dotfiler.py script to create the symlink.
