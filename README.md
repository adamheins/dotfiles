# Configuration
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
  directory into the correct places on the local machine.

## Current Tools
A list of many of the tools I find useful.
* [ack](http://beyondgrep.com/): A source code search tool.
* [bash](https://www.gnu.org/software/bash/): bash is the shell I currently
  use, mainly due to its ubiquity and featurefulness.
* [Cscope](http://cscope.sourceforge.net/): A code search tool for C and other
  languages.
* [fzf](https://github.com/junegunn/fzf): A fuzzy-finder for the command line.
* [Homebrew](http://brew.sh/): A package manager for OSX.
* [mosh](https://mosh.mit.edu/): A more robust replacement for ssh.
* [pass](http://www.passwordstore.org/): A local password manager.
* [vim](http://www.vim.org/): An excellent text editor.
* [z](https://github.com/rupa/z): Learns which directories you visit most and
  takes you there based on a regex.

## Prospective Tools
These are tools that I am interested in using in the future, once the projects
are more mature.
* [neovim](https://neovim.io/): A rewrite of vim to strip out the cruft.
  Doesn't currently have full lua support so it breaks some plugins.
* [xonsh](http://xonsh.org/): A cool shell that fully supports Python and parses
  some bash configuration. Still in a fairly early phase and lacking some
  features.

## Vim Plugins
Some of the plugins I use for vim.
* [NeoComplete](https://github.com/Shougo/neocomplete.vim): Autocompletion
  engine that is very featureful and easy to setup.
* [Cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html): A plugin
  for the code search tool mentioned above.
* [ctrlp](https://github.com/kien/ctrlp.vim) File search plugin.
* [better-whitespace](https://github.com/ntpeters/vim-better-whitespace):
  Highlights trailing whitespace and makes it easy to remove.
* [numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggle
  line numbers between absolute and relative mode.
