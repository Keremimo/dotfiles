if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
  #kitten icat --align left ~/Pictures/okay.png
end
starship init fish | source
fish_add_path /home/kerem/.spicetify
zoxide init fish | source
alias cd=z
alias ls=eza

thefuck --alias | source

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

set -Ux EDITOR nvim
set fzf_preview_dir_cmd eza --all --color=always
set fzf_fd_opts --hidden --max-depth 5

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
/home/kerem/.local/bin/mise activate fish | source


# Added by `rbenv init` on Thu Dec 12 10:17:55 AM CET 2024
status --is-interactive; and ~/.rbenv/bin/rbenv init - --no-rehash fish | source
