if onpath keychain; then
  eval $(keychain --quiet --eval --agents ssh id_rsa id_ed25519)
fi
