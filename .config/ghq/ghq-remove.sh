#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ghq-rm <repository-name>"
  exit 1
fi

repo_name=$(ghq list | grep "$1")
repo_path=$(ghq list --full-path | grep "$1")

if [ -z "$repo_path" ]; then
  echo "No such repository"
  exit 1
else
  ghq rm "$repo_name"
  grep -rvF "$repo_path" ~/.config/zoxide/.zoxideignore >"$temp_file"
  mv "$temp_file" ~/.config/zoxide/.zoxideignore
fi
