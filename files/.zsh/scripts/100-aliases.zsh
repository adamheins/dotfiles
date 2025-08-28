# Shell Aliases
# Adam Heins

# ================================= General ================================== #

# Vim.
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

# Change file's executability permissions.
alias -- +x="chmod +x"
alias -- -x="chmod -x"

# Decrypt files to stdout.
alias decrypt="gpg --decrypt --quiet --batch"

# Python package source code locations.
alias p2dist="cd /usr/local/lib/python2.7/dist-packages"
alias p3dist="cd /usr/local/lib/python3.5/dist-packages"
alias p2lib="cd /usr/lib/python2.7"
alias p3lib="cd /usr/lib/python3.5"

# Size of files and directories.
alias fsize="du -h --apparent-size"
alias dsize="du -sh --apparent-size"

alias mine="sudo chown -R $(whoami)"

alias timer='while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done'

function open() {
  xdg-open $1 </dev/null &>/dev/null &
}

# easily source Python virtualenv
alias v="source .venv/bin/activate"


# =============================== Date & Time ================================ #

# Today's date and time, in a nice format.
alias now="date +%F\ %T"


# ============================ Modified Builtins ============================= #

# Start the calculator with math support.
alias bc="bc -l"

# Make cd follow symlinks by default.
alias cd="cd -P"


# ============================ Replaced Builtins ============================= #

# Override by using `\builtin` or `command builtin`

if onpath safe-rm; then
  alias rm=safe-rm
fi

if onpath exa; then
  alias ls=exa
  alias la="exa -la"
  alias tree="exa --tree"
else
  alias ls="ls --color=auto"
  alias la="ls -A"
fi

if onpath batcat; then
  alias bat=batcat
fi

if onpath htop; then
  alias top=htop
fi

if onpath icdiff; then
  alias diff=icdiff
fi
