# Configuration

- [Intro](#intro)
- [Bash](#bash)
- [Tmux](#tmux)
- [Vim](#vim)
- [Other Tools](#other-tools)

## Intro
This repo contains my standard configurations for POSIX systems. The intention
is that this repo can be easily cloned and deployed to configure new machines
and users.

The `configurator` python script is used to interact with the repo:
* `./configurator clean` will remove all configuration files from the repo's
  directory.
* `./configurator copy` will copy the configuration files from the local
  machine to the repo's directory.
* `./configurator paste` will paste the configuration files in the repo's
  directory into the correct places on the local machine.

## [Bash](https://www.gnu.org/software/bash/)
Bash is the shell I currently use, mainly due to its ubiquity and
featurefulness. You may prefer other shells like [zsh](http://www.zsh.org/)
or the exotic [fish](http://fishshell.com/).

## [Tmux](https://tmux.github.io/)
Tmux is a terminal multiplexer.

## [Vim](http://www.vim.org/)
The best of editors.

### Plugins
#### NeoComplete
Autocompletion engine that is very featureful and easy to setup.

#### CScope
Ensure that cscope is downloaded. Then, once a cscope database has been built
for a project, vim can easily search the entire project with the `:cs` command.

#### ctrl-p
File search plugin. Press `<C-p>` to search.

#### vim-better-whitespace
Highlights trailing whitespace. Use `:StripWhitespace` to remove trailing
whitespace.

#### vim-numbertoggle
Toggle line numbers between absolute and relative mode with `<C-n>`.

## Other Tools
* [ack](http://beyondgrep.com/)
* [Homebrew](http://brew.sh/) (on OSX)
* [fzf](https://github.com/junegunn/fzf)
