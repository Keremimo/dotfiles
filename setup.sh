#!/usr/bin/bash
set -e

sudo systemctl enable --now bluetooth

sudo pacman -S --noconfirm --needed wl-clipboard

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
cat ~/.ssh/id_ed25519.pub | wl-copy
read -n 1 -p "Press 1 to continue after inputting your ssh key into github."

sudo pacman -S --noconfirm --needed base-devel stow ghostty lua fd ripgrep yazi eza pipewire dunst noto-fonts-emoji libgtop bluez bluez-utils btop networkmanager brightnessctl python gnome-bluetooth-3.0 pacman-contrib gvfs tlp hyprland hyprpaper pavucontrol nm-connection-editor swww fish starship unzip git curl wget bash-completion fuzzel rustup go waybar neovim kitty fzf polkit chromium nerd-fonts swaync gtk2 gtk3 gtk4 sddm thefuck zoxide nodejs yarn npm gnome-keyring flatpak udiskie qt5-wayland qt6-wayland niri &&

rustup default stable

git config --global user.name "Kerem Kilic"
git config --global user.email "code@kerem.tech"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf ./paru
paru -S --noconfirm catppuccin-gtk-theme-mocha
git clone git@github.com:Keremimo/dotfiles.git
cd ~/dotfiles
stow . --adopt
cd
git clone git@github.com:Keremimo/nvim.git ~/.config/nvim
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher | fish
fisher install nickeb96/puffer-fish | fish
fisher install PatrickF1/fzf.fish | fish
chsh -s /usr/bin/fish

sudo flatpak override --filesystem=$HOME/.local/share/themes
# Change to suite your flavor / accent combination
export FLAVOR="mocha"
export ACCENT="mauve"

# Set the theme
sudo flatpak override --env=GTK_THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"
