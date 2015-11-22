# ~/.\*
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users. The dotfiles themselves are located in the `files` directory.

## Branches
There are a number of branches in the repo. They are:
* __osx__: Dotfiles for configuring OSX machines.
* __linux__: Dotfiles for configuring GNU/Linux machines.
* __bash__: Contains deprecated bash dotfiles.

## Install
Get set up with these dotfiles:
```bash
git clone git@github.com:adamheins/dotfiles ~/.dotfiles
cd ~/.dotfiles
./dotfiler
```
The dotfiler script backs up all of the local machine's current dotfiles and
then creates symlinks to the dotfiles in this repo.
