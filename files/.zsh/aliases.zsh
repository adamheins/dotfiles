# Shell Aliases
# Adam Heins

# Display detailed info about cd directory stack.
alias dirs="dirs -v"

alias cl="clear"
alias v="vim"
alias x="exit"
alias psg="ps aux | grep"

alias untar="tar xzf"

# Today's date and time, in a nice format.
alias now="date +%F\ %T"

# Make cscope recursive by default, and shorter.
alias cs="cscope -R"

# Handy todo list.
alias t="$EDITOR ~/.todo"

# Start the calculator with math support.
alias bc="bc -l"

# Make cd follow symlinks by default.
alias cd="cd -P"

# Allow mkdir to create intermediate directories.
alias mkdir="mkdir -p"

# Aliases for ls.
case $OS in
  Darwin) alias ls="ls -G" ;;
  *) alias ls="ls --color=auto" ;;
esac
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Easily navigate to parent directories.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Easily switch back to previous directories.
alias -- -="cd +1 >/dev/null 2>&1"
alias -- --="cd +2 >/dev/null 2>&1"
alias -- ---="cd +3 >/dev/null 2>&1"

# Git aliases.
alias gst="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gp="git pull"
alias gch="git checkout"
alias g-="git checkout -"
