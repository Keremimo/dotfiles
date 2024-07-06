if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
	figlet "Hi Kerem!" | lolcatjs
end
oh-my-posh init fish | source

fish_add_path /home/kerem/.spicetify
zoxide init fish | source
alias cd=z
~/.local/bin/mise activate fish | source
