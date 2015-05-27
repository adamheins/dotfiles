# Bash and things I want in login shells goes here.
. ~/.bashrc

# Non-bash-specific things go in .profile.
. ~/.profile

# Source everything in the .scripts folder.
for f in ~/.scripts/*; do
   . $f
done
