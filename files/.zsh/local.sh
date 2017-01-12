here=${0:a:h}
local=$here/local

# Autocompletion.
if [ -d $local/comp ]; then
  fpath=($fpath $local/comp)
fi

# Scripts to be sourced.
# Note the glob pattern:
#   .  Match plain files
#   ,  "OR"
#   @  Match symbolic files
#   N  NULL_GLOB - don't print an error if nothing matched
if [ -d $local/scripts ]; then
  for f in $local/scripts/*.sh(.,@N); do source "$f"; done
  for f in $local/scripts/*.zsh(.,@N); do source "$f"; done
fi
