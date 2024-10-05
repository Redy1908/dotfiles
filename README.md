# dotfiles

# Software i'm using
- [Alacritty](https://github.com/alacritty/alacritty)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Starship](https://github.com/starship/starship)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Lsd](https://github.com/lsd-rs/lsd)
- [Bat](https://github.com/sharkdp/bat)

# WSL configuration

I mainly use this configuration from WSL (Windows Subsystem for Linux).

## To reproduce the configuration on Windows:

### Prerequisites
Install Alacritty from the [source](https://github.com/alacritty/alacritty).

Move/copy the folder `alacritty` from `.windows/` to `%APPDATA%/roaming/`

Install Starship from the [source](https://github.com/starship/starship).

Move/copy the file `.windows/starship/starship.toml` to `C:\Users\Username\.config` 

### Install WSL and a Linux distribution:
From the terminal: `wsl --install` then `wsl --install -d <DistroName>`

Run your distro, clone this repository and run the script `install.sh` the setup is now complete.

# To reproduce the configuration on Linux

Clone this repository and run the script `install.sh`.

