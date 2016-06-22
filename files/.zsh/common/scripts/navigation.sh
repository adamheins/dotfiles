# Directory navigation.
# Adam Heins

alias dirs="dirs -v"

# Switch back to previous directories.
alias -- -="cd +1 >/dev/null 2>&1"
alias -- --="cd +2 >/dev/null 2>&1"
alias -- ---="cd +3 >/dev/null 2>&1"

# Navigate to parent directories.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

