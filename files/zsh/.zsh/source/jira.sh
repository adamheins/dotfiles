#!/bin/zsh

# Simple JIRA CLI utility.

jira() {
  if [ -z "$1" ]; then
    open "$JIRA_URL""/secure/Dashboard.jspa"
    return 0
  fi
  if [ "$1" == "?" ]; then
    open "$JIRA_URL""/secure/QuickSearch.jspa?searchString=""$2"
  elif [ "$1" == "q" ]; then
    open "$JIRA_URL""/issues/?jql=""$2"
  elif [ "$1" == "help" ]; then
    printf "\n%s\n%s\n%s\n%s\n%s\n\n"                                  \
           "A simple JIRA CLI utility. Usage:"                         \
           "jira             Open your JIRA dashboard."                \
           "jira <issue>     Open <issue> in JIRA."                    \
           "jira ? <str>     Perform a simple string search on <str>." \
           "jira q <query>   Perform a query-based search on <query>."
  else
    if [[ "$1" == PBL-* ]]; then
      open "$JIRA_URL""/browse/""$1"
    else
      open "$JIRA_URL""/browse/""$JIRA_PREFIX""$1"
    fi
  fi
  return 0
}
