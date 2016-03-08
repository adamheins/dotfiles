# Shell Aliases
# Adam Heins

# ================================= General ================================== #

alias cl="clear"
alias v="vim"
alias x="exit"
alias lo="logout"
alias psg="ps aux | grep"
alias untar="tar -xf"
alias c="gcc -std=c99"

alias update="sudo apt-get update && sudo apt-get upgrade"

# Today's date and time, in a nice format.
alias now="date +%F\ %T"

# Make cscope recursive by default, and shorter.
alias cs="cscope -R"

# Handy todo list.
alias t="$EDITOR ~/.todo/todo.md"

# Base conversion. Note that the `base' tool must be installed.
alias hex="base 10:16"
alias unhex="base 16:10"

# Change file's executability permissions.
alias -- +x="chmod +x"
alias -- -x="chmod -x"

# ============================ Modified Builtins ============================= #

# Display detailed info about cd directory stack.
alias dirs="dirs -v"

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

# =========================== Directory navigation =========================== #

# Easily navigate to parent directories.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Easily switch back to previous directories.
alias -- -="cd +1 >/dev/null 2>&1"
alias -- --="cd +2 >/dev/null 2>&1"
alias -- ---="cd +3 >/dev/null 2>&1"

# =================================== Git ==================================== #

# Note that git status is wrapped by a function `gs' which adds some additional
# functionality.
ga() {
  if [ -z "$1" ]; then
    git add -A
  else
    git add ${@:1}
  fi
}
alias gb="git branch"
alias gc="git commit"
alias gp="git pull"
alias gch="git checkout"
alias gg="git grep"
alias grhh="git reset --hard HEAD"
alias g-="git checkout -"
alias gl="git log"
