#!/usr/bin/env fish

set -gx FZF_DEFAULT_OPTS "--layout=reverse --height=45% --border --preview-window=down:30%"

if test -z "$argv[1]"
    set repo_name (ghq list --unique | fzf --preview 'ls --grid (ghq list -p | rg {})')
else
    set repo_name (ghq list --unique | rg "$argv[1]" | fzf --ansi)
end

set repo_path (ghq list -p | grep "/$repo_name\$")

cd "$repo_path"
