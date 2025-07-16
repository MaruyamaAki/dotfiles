#/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ghq-get <repository-url>"
  exit 1
else
  ghq get "$1"
  repo_name="${1##*/}"
  repo_path=$(ghq list --full-path | grep "$repo_name")
  echo "$repo_path" >>~/.config/zoxide/.zoxideignore
fi
