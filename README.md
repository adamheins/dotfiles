# dotfiles
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users.

## Configurator Tool
The `configurator` python script is used to interact with the repo:
* `./configurator clean` will remove all configuration files from the repo's
  directory.
* `./configurator copy` will copy the configuration files from the local
  machine to the repo's directory.
* `./configurator paste` will paste the configuration files in the repo's
  directory into the correct places on the local machine. This will
  automatically backup the local machine's files to `backup` in the dotfiles
  directory.

## Current Tools
A list of many of the tools I find useful.
* [ag](https://github.com/ggreer/the_silver_searcher): A wicked fast source
  code search tool.
* [Cscope](http://cscope.sourceforge.net/): A code search tool for C and other
  languages.
* [fzf](https://github.com/junegunn/fzf): A fuzzy-finder for the command line.
* [Homebrew](http://brew.sh/): A package manager for OSX.
* [mosh](https://mosh.mit.edu/): A more robust replacement for ssh.
* [pass](http://www.passwordstore.org/): A local password manager.
* [vim](http://www.vim.org/): An excellent text editor.
* [z](https://github.com/rupa/z): Learns which directories you visit most and
  takes you there based on a regex.
* [zsh](http://www.zsh.org/): zsh is the shell I currently use. Its mostly
  compatible with bash and is somewhat more refined.

## Prospective Tools
These are tools that I am interested in using in the future, once the projects
are more mature.
* [neovim](https://neovim.io/): A rewrite of vim to strip out the cruft.
  Doesn't currently have full lua support so it breaks some plugins.

## Vim Plugins
Some of the plugins I use for vim.
* [NeoComplete](https://github.com/Shougo/neocomplete.vim): Autocompletion
  engine that is very featureful and easy to setup.
* [Cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html): A plugin
  for the code search tool mentioned above.
* [ctrlp](https://github.com/kien/ctrlp.vim): File search plugin.
* [better-whitespace](https://github.com/ntpeters/vim-better-whitespace):
  Highlights trailing whitespace and makes it easy to remove.
* [numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggle
  line numbers between absolute and relative mode.
