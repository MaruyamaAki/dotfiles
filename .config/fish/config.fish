set fish_greeting ""

set -gx TERM xterm-256color

# Add the default location for executables installed by Homebrew to the PATH.
set PATH /opt/homebrew/bin $PATH

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
source ~/.config/fish/aliases.fish

# custom command
source ~/.config/fish/functions/ghq.fish
source ~/.config/fish/functions/cd.fish


# If the session is interactive...
if status is-interactive
    # init oh-my-posh  
    oh-my-posh init fish --config ~/.config/posh/config.json | source

    # session starts tmux
    if not set -q TMUX
        tmux new-session -A -s default
    end
end

# zoxide init
export _ZO_EXCLUDE_DIRS="$HOME/.ghq/**/*"
zoxide init fish | source
