# ~/.\*
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users. The dotfiles themselves are located in the `files` directory.

## Shell
You need to be using zsh to make use of these dotfiles. Change your shell using
the following command:

```sh
chsh -s /bin/zsh
```

Then restart your shell session.

## User Directories
Change the `$HOME` directory structure by editing `~/.config/user-dirs.dirs`.

## Dotfiler

### Install
Get set up with these dotfiles:

```sh
git clone --recursive git@github.com:adamheins/dotfiles ~/.dotfiles
cd ~/.dotfiles
./dotfiler.py
```

The dotfiler.py script backs up all of the local machine's current dotfiles and
then creates symlinks to the dotfiles in this repo.

### Add a dotfile
1. Move the dotfile from its current location to `~/.dotfiles/files/`.
2. Add the file to the config/links.json file.
3. Run the dotfiler.py script to create the symlink.

### Managing Dependencies
There may be dependencies that must be installed on the system before the
dotfiler is run. These would be programs without which the system would be
unusable with the dotfile set up. These programs should be added to the
config/dependencies.json file.

### Running shell scripts
The dotfiler is also capable of running shell scripts as its final step, to
further configure the system. The shell scripts are assumed to reside somewhere
in the tools directory, and should be listed in the next.json file.
