# 1. Environment & PATH --------------------------------------
# Add Homebrew path (for Apple Silicon)
export PATH="/opt/homebrew/bin:$PATH"

# Add local user bin path (for local tools)
export PATH="$HOME/.local/bin:$PATH"

# Add OrbStack path (for Orbstack tools)
export PATH="$HOME/.orbstack/bin:$PATH"

# Add /usr/local/bin path (for Intel Macs, if needed)
export PATH="/usr/local/bin:$PATH"

export EDITOR="vim"
export PAGER="less"
export XDG_CONFIG_HOME="$HOME/.config"

export _ZO_EXCLUDE_DIRS="$HOME/.ghq/**/*"

export FZF_DEFAULT_OPTS="--layout=reverse --height=45% --border --preview-window=down:30%"

# initialize nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"


# 2. Zsh options ---------------------------------------------
# setopt pushdignoredups      # no duplicate dirs in pushd stack
# setopt prompt_subst         # allow $(...) in PROMPT
# setopt correct              # spell-check directory names when cd
# setopt hist_ignore_all_dups # no dupes in history
# setopt share_history        # share cmd-line history across terminals
# setopt append_history       # append (not overwrite) on shell exit
# setopt inc_append_history   # write each command immediately
# setopt extended_glob        # advanced globbing (eg. ^*~.*)

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# 3. Completion & key-bindings -------------------------------
# autoload -Uz compinit
# mpinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION" 2>/dev/null

# 3.1 Oh‑My‑Posh completions
if command -v oh-my-posh >/dev/null 2>&1; then
  # eval "$(oh-my-posh completion zsh)"
fi

# 3.2 Autosuggestions & syntax highlighting
#   brew install zsh-autosuggestions zsh-syntax-highlighting
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# 3.3 Syntax highlighting (optional but useful)
#   brew install zsh-syntax-highlighting
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
#   source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
# zsh-syntax-highlighting should be sourced last among completion plugins.

# 4.1 seup ghq
ghq() {
  if [ "$1" = "repo" ]; then
    shift
    . ~/.config/ghq/ghq-repo.sh "$@" 2>/dev/null
  else
    command ghq "$@"
  fi
}

# 4.2 cd to zoxide
unalias cd 2>/dev/null
cd() {
  if [[ -z "$1" ]]; then
    builtin cd ~
  elif [[ "$1" == /* ]] || [[ -d "$1" ]]; then
    if builtin cd "$1"; then
      zoxide add "$(pwd)"
    fi
  else 
    zi "$1"
  fi
}

# 5. Aliases --------------------------------------------------
[[ -f "$HOME/.zsh_aliases" ]] && source "$HOME/.zsh_aliases"

# 6. Local overrides -----------------------------------------
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# 7. enabe starship
eval "$(starship init zsh)"

# 7.2 enable zoxide
eval "$(zoxide init zsh)"





# End ---------------------------------------------------------

