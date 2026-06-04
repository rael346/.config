fish_add_path "/usr/local/bin"
fish_add_path "/usr/local/go/bin"
fish_add_path "go/bin"

switch (uname)
  case Darwin
    fish_add_path "/opt/homebrew/bin"
    fish_add_path "/opt/homebrew/sbin"
  case Linux
    fish_add_path "~/program-src/lua-language-server/bin"
end 

function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience
fzf --fish | source
# fnm env --use-on-cd --version-file-strategy=recursive | source

# remove fish greeting when opening a new session
set -g fish_greeting

switch (uname)
  case Darwin
    set -gx SHELL "/opt/homebrew/bin/fish"
  case Linux
    set -gx SHELL "/usr/bin/fish"
end 

set -gx EDITOR "/usr/local/bin/nvim"

set -g fish_key_bindings fish_vi_key_bindings
bind -M visual y fish_clipboard_copy
bind -M normal yy fish_clipboard_copy
bind p fish_clipboard_paste

set -gx EMSDK_QUIET 1
switch (uname)
  case Darwin
    source "~/Desktop/projects/emsdk/emsdk_env.fish"
  case Linux
end 

