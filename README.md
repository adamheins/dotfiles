# ~/.\*
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users. The dotfiles themselves are located in the `files` directory.

The dotfiles are written so that the same copies can be used for both OSX and
Linux.

## Install
Get set up with these dotfiles:
```bash
git clone --recursive git@github.com:adamheins/dotfiles ~/.dotfiles
cd ~/.dotfiles
./dotfiler
```
The dotfiler script backs up all of the local machine's current dotfiles and
then creates symlinks to the dotfiles in this repo.

## Add a dotfile
Adding a dotfile is straightforward:  
* Copy the dotfile from your home directory to `~/.dotfiles/files/`.  
* Make a symlink from the new location back to the old location:
```
ln -s ~/.dotfiles/files/<file> ~/<file>
```
* Add the dotfile to the `DOTFILES` array in the `dotfiler` script.  
