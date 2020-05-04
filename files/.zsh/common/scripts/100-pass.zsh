# if onpath gopass; then
#   alias pass=gopass
#   alias p="gopass show -c"
# elif onpath pass; then
#   alias p="pass show -c"
# fi
if onpath pass; then
  alias p="pass show -c"
fi
