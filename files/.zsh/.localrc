here=${0:a:h}
local=$here/local

# Autocompletion.
if [ -d $local/comp ]; then
  fpath=($fpath $local/comp)
fi

# Scripts to be sourced.
if [ -d $local/scripts ]; then
  for f in $local/scripts/*.sh(.N); do source "$f"; done
  for f in $local/scripts/*.zsh(.N); do source "$f"; done
fi
