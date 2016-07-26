# Shell Directory Structure
This directory holds files related to interactive shell sessions. Much of it is
specifically targeted at zsh, my shell of choice.

The entry point is the .zshrc file. Further files are divided into two
categories: common and local. These directories are structured in the same way,
the only difference being that the local directory is only for files relevant
to the local machine, and is ignored by git. This is useful for things like
work-related scripts.

There is a .commonrc and a .localrc file that are simply shell scripts that
manage the common and local directories, respectively. These are sourced by the
.zshrc.

The common and local directories each (optionally) contain the following:
* tps: Third-party software, often stored in git submodules.
* exe: Executable files.
* scripts: Shell scripts which are sourced on startup.

The exe directory is further divided into recipes and util. Util are executable
scripts for miscellaneous utility tasks. Recipes, on the other hand, are for
software that should be installed on the system. This software may require
extra steps to install, such as compilation.
