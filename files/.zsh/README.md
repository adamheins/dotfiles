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
* comp: zsh tab-completion scripts.
* scripts: Shell scripts which are sourced on startup.
* tps: Third-party software, often stored in git submodules.
