if onpath gopass; then
  # Use the bash completion for gopass because the zsh completion is somewhat
  # broken.
  autoload -U compinit && compinit
  autoload -U bashcompinit && bashcompinit
  source <(gopass completion bash)

  alias pass=gopass
  alias p="gopass show -c"
elif onpath pass; then
  alias p="pass show -c"
fi
