# ~/.\*
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users. The dotfiles themselves are located in the `files` directory.

## Branches
There are a number of branches in the repo. They are:
* __bash__: Contains deprecated bash dotfiles.
* __osx__: Dotfiles for configuring OSX machines.
* __linux__: Dotfiles for configuring GNU/Linux machines.

## Dotfiler Script
The `dotfiler` script is used to interact with the repo:
* `./dotfiler clean` will remove all dotfiles from the repo's directory.
* `./dotfiler copy` will copy the dotfiles from the local machine to a
  directory named `files`.
* `./dotfiler paste` will paste the dotfiles in the `files` directory to the
  home directory of the local machine. This will automatically backup the local
  machine's dotfiles to a directory named `backup`.
* `./dotfiler link` creates symlinks of dotfiles on the local machine to this
  repo. This will automatically backup the local machine's dotfiles to a
  directory named `backup`.
* `./dotfiler clone` will clone necessary repositories.
* `./dotfiler tar` will create a tar file containing all dotfiles.
