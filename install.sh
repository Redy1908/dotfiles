#!/bin/bash

# Update and Upgrade
sudo apt update
sudo apt upgrade

# Adding Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Packages installation
sudo apt install build-essential unzip xclip ripgrep neovim stow tmux zoxide bat lsd -y

# Neovim files
git clone https://github.com/Redy1908/nvim.git ./.config/nvim

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes

if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc
then
    echo -e '\neval "$(starship init bash)"' >> ~/.bashrc
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

# Aliases for the commands
if ! grep -Fxq 'alias cd='z'' ~/.bashrc
then
    echo -e "\nalias cd='z'" >> ~/.bashrc
fi

if ! grep -Fxq 'alias cat='bat'' ~/.bashrc
then
    echo "alias cat='bat'" >> ~/.bashrc
fi

if ! grep -Fxq 'alias ls='lsd'' ~/.bashrc

then
    echo "alias ls='lsd'" >> ~/.bashrc
fi

# Aliases for the scripts
if ! grep -Fxq "alias dev=~/dev.sh" ~/.bashrc
then
    echo -e "\nalias dev=~/dev.sh" >> ~/.bashrc
fi

# Run permission for the scripts
chmod +x ~/dev.sh

source ~/.bashrc

# Windows
windows_user=$(cmd.exe /c "echo %USERNAME%" | tr -d '\r')

# Alacritty
output_file="alacritty.toml"
cp .windows/alacritty/alacritty.toml $output_file

cat <<EOF >> alacritty.toml

[general]
import = [
  "C:\\\Users\\\\$windows_user\\\AppData\\\Roaming\\\alacritty\\\themes\\\tokyo-night.toml"
]

working_directory = "C:\\\Users\\\\$windows_user"

EOF
mkdir /mnt/c/Users/$windows_user/AppData/Roaming/alacritty

cp -r .windows/alacritty/themes /mnt/c/Users/$windows_user/AppData/Roaming/alacritty
cp alacritty.toml /mnt/c/Users/$windows_user/AppData/Roaming/alacritty

rm alacritty.toml

# Starship 
mkdir /mnt/c/Users/$windows_user/.config
cp .windows/starship/starship.toml /mnt/c/Users/$windows_user/.config
mkdir /mnt/c/Users/$windows_user/Documents/PowerShell
touch /mnt/c/Users/$windows_user/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
echo "Invoke-Expression (&starship init powershell)" >> /mnt/c/Users/$windows_user/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
