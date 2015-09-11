# Bash and things I want in login shells goes here.
. ~/.bashrc

# Non-bash-specific things go in .profile.
[ -f ~/.profile ] && . ~/.profile

# Local configuration.
[ -f ~/.bash_local ] && . ~/.bash_local

# Aliases.
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Source everything in the .scripts folder.
for f in ~/.scripts/*; do
   . $f
done
