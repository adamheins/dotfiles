alias vim=/usr/local/bin/vim # Use vim installed by brew instead of system vim.
alias ls="ls -G"
alias pwaf="pypy waf"

# Aliases for ls.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Aliases for changing directories.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias -- -="cd - >/dev/null 2>&1"
alias -- --="cd -2 >/dev/null 2>&1"
alias -- ---="cd -3 >/dev/null 2>&1"

# Git aliases. Note that git push is intentionally left out because I don't
# want to fuck around with pushing.
alias gst="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gp="git pull"
alias gch="git checkout"
