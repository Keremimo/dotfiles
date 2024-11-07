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

thefuck --alias | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
