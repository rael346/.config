fish_add_path "/opt/homebrew/opt/openblas/lib"
fish_add_path "/opt/homebrew/opt/openblas/include"
fish_add_path "/opt/homebrew/opt/openblas/lib/pkgconfig"

fish_add_path "/opt/homebrew/bin"
fish_add_path "/opt/homebrew/sbin"
fish_add_path "/usr/local/bin"
fish_add_path "/usr/local/go/bin"
fish_add_path "go/bin"

function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience
fzf --fish | source
fnm env --use-on-cd | source

# remove fish greeting when opening a new session
set -g fish_greeting
# change the default shell of tmux
set -gx SHELL "/opt/homebrew/bin/fish"

set -g fish_key_bindings fish_vi_key_bindings
bind -M visual y fish_clipboard_copy
bind -M normal yy fish_clipboard_copy
bind p fish_clipboard_paste

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/duytran/micromamba"
$MAMBA_EXE shell hook --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
