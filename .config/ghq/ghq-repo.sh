#/bin/bash

if [[ -z "$1" ]]; then
  repo_name=$(ghq list --unique | fzf --preview 'ls -C $(ghq list -p | rg {})')
else
  repo_name=$(ghq list --unique | rg "$1" | fzf-tmux --ansi)
fi

repo_path=$(ghq list -p | grep "/$repo_name$")
cd "$repo_path"
