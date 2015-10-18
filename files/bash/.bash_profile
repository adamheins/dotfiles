# Bash and things I want in login shells go here.

# Bash configuration goes in .bashrc.
source ~/.bashrc

# Non-bash-specific things go in .profile.
[ -f ~/.profile ] && source ~/.profile

# Bash aliases.
[ -f ~/.bash/aliases.bash ] && source ~/.bash/aliases.bash

# Local configuration.
if [ -d ~/.bash/local ]; then
  for f in ~/.bash/local/*; do
    source "$f"
  done
fi

# Custom shell scripts.
if [ -d ~/.bash/source ]; then
  for f in ~/.bash/source/*.sh; do source "$f"; done
  for f in ~/.bash/source/*.zsh; do source "$f"; done
fi

# Executables.
[ -d ~/.bash/bin ] && export PATH=~/.bash/bin:$PATH
