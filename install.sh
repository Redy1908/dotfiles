#!/bin/bash

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Update and Upgrade
sudo apt update
sudo apt upgrade

# Some utility packages
sudo apt install make gcc ripgrep unzip git xclip neovim stow tmux

# Starship
curl -sS https://starship.rs/install.sh | sh

if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc
then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

# Zoxide
sudo apt install zoxide
if ! grep -Fxq 'eval "$(zoxide init bash)"' ~/.bashrc
then
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
fi

# Rust
curl https://sh.rustup.rs -sSf | sh

# LSD
cargo install lsd

# Bat
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

#  ---

if ! grep -Fxq "alias dev=~/dev.sh" ~/.bashrc
then
    echo "alias dev=~/dev.sh" >> ~/.bashrc
fi

if ! grep -Fxq "alias cDeveloping=~/cDeveloping.sh" ~/.bashrc
then
    echo "alias cDeveloping=~/cDeveloping.sh" >> ~/.bashrc
fi

stow .

chmod +x ~/dev.sh 
chmod +x ~/cDeveloping

source ~/.bashrc
