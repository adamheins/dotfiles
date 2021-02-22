# Nix package manager.
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
  fpath+=~/.nix-profile/share/zsh/site-functions
fi
