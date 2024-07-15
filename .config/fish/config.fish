if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
  #kitten icat --align left ~/Pictures/okay.png
end
#oh-my-posh init fish --config /usr/share/oh-my-posh/themes/kushal.omp.json | source
starship init fish | source
fish_add_path /home/kerem/.spicetify
zoxide init fish | source
alias cd=z
~/.local/bin/mise activate fish | source

thefuck --alias | source
