# Bash and things I want in login shells go here.

# Bash configuration goes in .bashrc.
source ~/.bashrc

# Non-bash-specific things go in .profile.
[ -f ~/.profile ] && . ~/.profile

# Bash aliases.
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Local configuration.
if [ -d ~/.bash_local ]; then
  for f in ~/.bash_local/*; do
    source "$f"
  done
fi

# Custom shell scripts.
if [ -d ~/.scripts/source/bash ]; then
  for f in ~/.scripts/source/bash/*; do
    source "$f"
  done
fi

# External scripts.
if [ -d ~/.scripts/source/ext ]; then
  for f in ~/.scripts/source/ext/*; do
    source "$f"
  done
fi

# Custom executables.
[ -d ~/.scripts/exec ] && export PATH=~/.scripts/exec:$PATH
