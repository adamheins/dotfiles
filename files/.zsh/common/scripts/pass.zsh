if onpath gopass; then
  source <(gopass completion zsh)
  alias pass=gopass
  alias p="gopass show -c"
elif onpath pass; then
  alias p="pass show -c"
fi
