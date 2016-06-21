# Shell Aliases
# Adam Heins

# ================================= General ================================== #

alias cl="clear"
alias v="vim"
alias x="exit"
alias lo="logout"
alias psg="ps aux | grep"

# Install debian packages.
alias deb="sudo dpkg -i"

# Web browser.
alias ff="nohup firefox > /dev/null 2>&1 &"

# Update packages.
alias update="sudo apt-get update && sudo apt-get upgrade"

# Unpack tarballs.
alias untar="tar -xf"

# Quick C compilation.
alias c="gcc -std=c99"

# Make cscope recursive by default, and shorter.
alias cs="cscope -R"

# Base conversion. Note that the `base' tool must be installed.
# https://github.com/adamheins/base
alias hex="base 10:16"
alias unhex="base 16:10"

# Change file's executability permissions.
alias -- +x="chmod +x"
alias -- -x="chmod -x"

# Convert html files to pdfs.
alias htmltopdf=wkhtmltopdf

# Get the duration of an mp3 file.
alias mp3len="mp3info -p \"%m:%s\\n\""

# Use foxit for PDFs.
alias pdf="d foxit"

# Decrypt files to stdout.
alias show="gpg --decrypt --quiet --batch"

# Dict
alias syn=synonym

m() {
  cd ~/dev/lang/matlab
  matlab
}

# ================================== Lists =================================== #

alias todo="vim ~/.todo/todo.md"
alias films="vim ~/.todo/media/films.yml"
alias books="vim ~/.todo/media/books.yml"

alias t="todo"

# =============================== Date & Time ================================ #

# Calendar shortcuts.
alias today="pal -d today"
alias tomorrow="pal -d tomorrow"
alias week="pal -r 7"

# Today's date and time, in a nice format.
alias now="date +%F\ %T"

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

# See source/git.zsh for git-related functions.

alias gb="git branch"
alias gc="git commit"
alias gp="git pull"
alias gch="git checkout"
alias gg="git grep"
alias grhh="git reset --hard HEAD"
alias grl="git revert HEAD"
alias g-="git checkout -"
alias gl="git log"
alias gd="git diff"
alias gdl="git diff HEAD~1..HEAD"
