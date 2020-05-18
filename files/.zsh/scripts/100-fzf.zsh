FZF_PATH="$(dirname $(readlink -f $(which fzf)))/.."

# Set up fzf.
if [ -d $FZF_PATH/bin ]; then
  path=($path $FZF_PATH/bin)
fi

# Man path.
if [ -d $FZF_PATH/man ]; then
  manpath=($manpath $FZF_PATH/man)
fi

# Auto-completion.
if [ -f $FZF_PATH/share/fzf/completion.zsh ]; then
  source $FZF_PATH/share/fzf/completion.zsh 2> /dev/null
fi

# Key bindings.
if [ -f $FZF_PATH/share/fzf/key-bindings.zsh ]; then
  source $FZF_PATH/share/fzf/key-bindings.zsh
fi

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf-tmux --exit-0)

  if [ -f "$out" ]; then
    $EDITOR "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir
