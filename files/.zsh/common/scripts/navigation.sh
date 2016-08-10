# Directory navigation.
# Adam Heins

alias dirs="dirs -v"

# Switch back to previous directories.
alias -- -="cd +1 >/dev/null 2>&1"
alias -- --="cd +2 >/dev/null 2>&1"
alias -- ---="cd +3 >/dev/null 2>&1"

alias -- -2="cd +2 >/dev/null 2>&1"
alias -- -3="cd +3 >/dev/null 2>&1"
alias -- -4="cd +4 >/dev/null 2>&1"
alias -- -5="cd +5 >/dev/null 2>&1"

# Navigate to parent directories.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

