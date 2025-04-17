# Shell Aliases
# Adam Heins

# ================================= General ================================== #

# Vim.
alias v="vim"
if onpath nvim; then
  alias vim="nvim"
fi

alias mine="sudo chown -R $USER"

alias cl="clear"

# Install debian packages.
alias deb="sudo dpkg -i"

# Update packages.
alias update="sudo apt update && sudo apt upgrade"

# Unpack tarballs.
alias untar="tar -xf"

# Quick C compilation.
alias cc="gcc -std=c99"

# Cscope aliases.
alias cs="cscope -d"
alias csb="cscope -bq"

# Base conversion. Note that the `base' tool must be installed.
# https://github.com/adamheins/base
alias hex="base 10:16"
alias unhex="base 16:10"

# Change file's executability permissions.
alias -- +x="chmod +x"
alias -- -x="chmod -x"

# Decrypt files to stdout.
alias show="gpg --decrypt --quiet --batch"

# Python package source code locations.
alias p2dist="cd /usr/local/lib/python2.7/dist-packages"
alias p3dist="cd /usr/local/lib/python3.5/dist-packages"
alias p2lib="cd /usr/lib/python2.7"
alias p3lib="cd /usr/lib/python3.5"

# Size of files and directories.
alias fsize="du -h --apparent-size"
alias dsize="du -sh --apparent-size"

# Use insect as a calculator. npm install -g insect
alias calc="insect"

alias mine="sudo chown -R $(whoami)"

# Get a nice `open` command, like on macOS.
# case $OS in
#   Linux) alias open="xdg-open" ;;
# esac

alias timer='while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done'

open() {
  xdg-open $1 </dev/null &>/dev/null &
}


# =============================== Date & Time ================================ #

# Today's date and time, in a nice format.
alias now="date +%F\ %T"


# ============================ Modified Builtins ============================= #

# Start the calculator with math support.
alias bc="bc -l"

# Make cd follow symlinks by default.
alias cd="cd -P"

# Allow mkdir to create intermediate directories.
alias mkdir="mkdir -p"


# ============================ Replaced Builtins ============================= #

# Override by using `\builtin` or `command builtin`

if onpath safe-rm; then
  alias rm=safe-rm
fi

if onpath exa; then
  alias ls=exa
  alias la="exa -a"
  alias tree="exa --tree"
else
  alias ls="ls --color=auto"
  alias la="ls -A"
fi

if onpath bat; then
  alias cat=bat
fi

if onpath htop; then
  alias top=htop
fi

if onpath icdiff; then
  alias diff=icdiff
fi
