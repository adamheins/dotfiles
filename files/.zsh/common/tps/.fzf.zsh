# Get this script's directory's absolute path.
here=${0:a:h}

# Setup fzf
if [[ ! "$PATH" == *$here/fzf/bin* ]]; then
  export PATH=$PATH:$here/fzf/bin
fi

# Man path
if [[ ! "$MANPATH" == *$here/fzf/man* && -d $here/fzf/man ]]; then
  export MANPATH=$MANPATH:$here/fzf/man
fi

# Auto-completion
[[ $- == *i* ]] && source $here/fzf/shell/completion.zsh 2> /dev/null

# Key bindings
source $here/fzf/shell/key-bindings.zsh

