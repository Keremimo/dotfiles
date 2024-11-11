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

# function fish_hybrid_key_bindings --description \
# "Vi-style bindings that inherit emacs-style bindings in all modes"
    # for mode in default insert visual
        # fish_default_key_bindings -M $mode
    # end
    # fish_vi_key_bindings --no-erase
# end
# set -g fish_key_bindings fish_hybrid_key_bindings

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
