#!/usr/bin/bash
set -e

sudo systemctl enable --now bluetooth

sudo pacman -S --noconfirm --needed wl-clipboard

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
#cat ~/.ssh/id_ed25519.pub | wl-copy
read -rp "Press enter to continue after inputting your ssh key into github."

sudo pacman -S --noconfirm --needed base-devel stow ghostty lua fd ripgrep yazi pipewire dunst noto-fonts-emoji libgtop bluez bluez-utils btop networkmanager brightnessctl python gnome-bluetooth-3.0 pacman-contrib gvfs tlp hyprland hyprpaper pavucontrol nm-connection-editor swww fish starship unzip git curl wget bash-completion fuzzel rustup go neovim kitty fzf polkit chromium nerd-fonts gtk3 gtk4 sddm zellij thefuck zoxide nodejs yarn npm gnome-keyring flatpak udiskie qt5-wayland qt6-wayland &&

rustup default stable

git config --global user.name "Kerem Kilic"
git config --global user.email ""
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

curl -fsSL https://bun.sh/install | bash && sudo ln -s $HOME/.bun/bin/bun /usr/local/bin/bun
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
git clone https://github.com/Keremimo/dotfiles.git
cd ~/dotfiles
stow . --adopt
cd
#paru -S --needed "ghostty-git" 
#git clone git@github.com:Keremimo/kickstart.nvim.git ~/.config/nvim
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher | fish
fisher install nickeb96/puffer-fish
fisher install PatrickF1/fzf.fish
chsh -s /usr/bin/fish
