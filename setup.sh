#!/usr/bin/bash
set -e

sudo systemctl enable --now bluetooth

sudo pacman -S --noconfirm --needed base-devel unzip git curl wget fuzzel hyprland hyprlock rust brightnessctl neovim kitty fzf polkit chromium nerd-fonts gtk3 gtk4 pipewire bluez bluez-utils btop networkmanager dart-sass python gnome-bluetooth-3.0 sddm fish starship zellij swww thefuck wl-clipboard zoxide nodejs yarn npm gnome-keyring flatpak gnome-software udiskie thunar qt5-wayland qt6-wayland obsidian spotify-launcher &&

git config --global user.name "keremimo"
git config --global user.email "nyaa@live.com"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
cat ~/.ssh/id_ed25519.pub | wl-copy
read -rp "Press enter to continue after inputting your ssh key into github."

curl -fsSL https://bun.sh/install | bash && sudo ln -s $HOME/.bun/bin/bun /usr/local/bin/bun
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
paru -S --noconfirm grimblast gpu-screen-recorder hyprpicker aylurs-gtk-shell-git visual-studio-code-bin
git clone git@github.com:Keremimo/dotfiles.git
cp -rf ~/dotfiles/.config/* ~/.config/
mkdir -p ~/Wallpapers
cp -rf ~/dotfiles/Wallpapers/* ~/Wallpapers
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
cd .bash_it
./install.sh
