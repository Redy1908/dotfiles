#!/bin/bash

# Update and Upgrade
sudo apt update
sudo apt upgrade

# Some utility packages
sudo apt install make gcc ripgrep unzip git xclip neovim stow tmux zoxide bat lsd

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Starship
curl -sS https://starship.rs/install.sh | sh

if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc
then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

# Zoxide
if ! grep -Fxq 'eval "$(zoxide init bash)"' ~/.bashrc
then
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
fi

# Bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Move the files to the correct locations
stow .

# Aliases for the scripts
if ! grep -Fxq "alias dev=~/dev.sh" ~/.bashrc
then
    echo "alias dev=~/dev.sh" >> ~/.bashrc
fi

if ! grep -Fxq "alias cdeveloping=~/cDeveloping.sh" ~/.bashrc
then
    echo "alias cdeveloping=~/cDeveloping.sh" >> ~/.bashrc
fi

# Run permission for the scripts
chmod +x ~/dev.sh
chmod +x ~/cDeveloping.sh

source ~/.bashrc
