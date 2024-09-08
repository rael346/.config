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
