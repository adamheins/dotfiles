# dotfiles
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users.

## Dotfiler Script
The `dotfiler` script is used to interact with the repo:
* `./dotfiler clean` will remove all configuration files from the repo's
  directory.
* `./dotfiler copy` will copy the configuration files from the local
  machine to the repo's directory.
* `./dotfiler paste` will paste the configuration files in the repo's
  directory into the correct places on the local machine. This will
  automatically backup the local machine's files to `backup` in the dotfiles
  directory.
* `./dotfiler tar` will create a tar file containing all dotfiles.

## Current Tools
A list of many of the tools I find useful. All of them are command line-based.
* [ag](https://github.com/ggreer/the_silver_searcher): A wicked fast source
  code search tool.
* [Cscope](http://cscope.sourceforge.net/): A code search tool for C and other
  languages.
* [f](https://github.com/adamheins/f) A tool to favourite files, directories,
  and git branches.
* [fzf](https://github.com/junegunn/fzf): A fuzzy-finder for the command line.
* [Homebrew](http://brew.sh/): A package manager for OSX.
* [mosh](https://mosh.mit.edu/): A more robust replacement for ssh.
* [pass](http://www.passwordstore.org/): A local password manager based on gpg.
* [vim](http://www.vim.org/): An excellent text editor.
* [Vimperator](http://www.vimperator.org/vimperator) An add-on for Firefox that
  makes it look and behave similar to vim.
* [z](https://github.com/rupa/z): Learns which directories you visit most and
  takes you there based on a regex.
* [zsh](http://www.zsh.org/): The shell I currently use. It's mostly compatible
  with bash and is somewhat more featureful.

## Prospective Tools
These are tools that I am interested in using in the future, once the projects
are more mature.
* [neovim](https://neovim.io/): A rewrite of vim to strip out the cruft.
  Doesn't currently have full lua support so it breaks some plugins.

## Vim Plugins
Some of the plugins I use for vim. For the full list, look in my
[~/.vim](https://github.com/adamheins/.vim/tree/master/bundle) repository.
* [a](http://www.vim.org/scripts/script.php?script_id=31) Toggles between
  header (.h) and (.c) files.
* [gitgutter](https://github.com/airblade/vim-gitgutter) Shows a git diff in
  the page gutter.
* [better-whitespace](https://github.com/ntpeters/vim-better-whitespace):
  Highlights trailing whitespace and makes it easy to remove.
* [Cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html): A plugin
  for the code search tool mentioned above.
* [ctrlp](https://github.com/kien/ctrlp.vim): File search plugin.
* [NeoComplete](https://github.com/Shougo/neocomplete.vim): Autocompletion
  engine that is very featureful and easy to setup.
* [NERDTree](https://github.com/scrooloose/nerdtree) A nice directory browing
  plugin.
* [numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggle
  line numbers between absolute and relative mode.
* [tcomment](https://github.com/vim-scripts/tComment) Provides shortcuts for
  commenting out blocks of code.
