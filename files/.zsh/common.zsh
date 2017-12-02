here=${0:a:h}
common=$here/common

# Scripts to be sourced.
if [ -d $common/scripts ]; then
  for f in $common/scripts/*.sh(.N); do source "$f"; done
  for f in $common/scripts/*.zsh(.N); do source "$f"; done
fi

# Completions.
#fpath=($common/comp $path)
