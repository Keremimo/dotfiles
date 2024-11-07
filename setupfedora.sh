#!/usr/bin/bash
set -e

# Enable and start Bluetooth service
sudo systemctl enable --now bluetooth

# Update system packages
sudo dnf update -y

# Install necessary packages with dnf for Fedora ARM
sudo dnf install -y @development-tools unzip git curl wget bash-completion rust cargo \
    neovim kitty fzf polkit chromium gtk3 gtk4 pipewire btop NetworkManager python3 \
    sddm zellij wl-clipboard zoxide nodejs yarn npm gnome-keyring flatpak udiskie \
    qt5-qtwayland qt6-qtwayland ripgrep thefuck powerline-fonts

# Set up Rust environment
rustup default stable

# Git configuration
git config --global user.name "Keremimo"
git config --global user.email "nyaa@live.com"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

# Generate SSH key and copy it to clipboard
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
cat ~/.ssh/id_ed25519.pub | wl-copy
read -rp "Press enter to continue after inputting your SSH key into GitHub."

# Install Bun (JavaScript runtime) and link it globally
curl -fsSL https://bun.sh/install | bash
sudo ln -s $HOME/.bun/bin/bun /usr/local/bin/bun

# Clone the dotfiles repository
git clone git@github.com:Keremimo/dotfiles.git
cp -rf ~/dotfiles/.config/* ~/.config/
mkdir -p ~/Wallpapers
cp -rf ~/dotfiles/Wallpapers/* ~/Wallpapers

# Install Bash-it and enable plugins
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent
source ~/.bashrc
bash-it enable plugin fzf zoxide alias-completion

# Install additional development tools and languages
sudo dnf install -y luarocks python3 yazi fd-find git-delta gcc binutils dotnet-runtime \
    dotnet-sdk aspnetcore-runtime mono-devel java-11-openjdk-devel dart kotlin elixir \
    make golang nasm R python3-nuitka ruby perl lua swift fortran ldoc

# Install global npm and yarn packages
yarn global add jest jsdoc typedoc
cargo install cargo-nextest
go install golang.org/x/tools/cmd/godoc@latest

# Use Flatpak for apps not available natively on ARM
flatpak install flathub com.visualstudio.code -y
flatpak install flathub org.chromium.Chromium -y

# Set up NeoVim configuration (if using custom nvim config)
git clone git@github.com:Keremimo/NormalNvim.git ~/.config/nvim
