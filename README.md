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
- Install a [nerd font](https://www.nerdfonts.com/font-downloads).
- Install [Alacritty](https://github.com/alacritty/alacritty).
- Install [Starship](https://github.com/starship/starship).

### Set-up
Move/copy the folder `alacritty` from `.windows/` to `%APPDATA%/roaming/`

Edit the file `%APPDATA%/roaming/alacritty/alacritty.toml`: set your `shell executable`, edit the `username` in the `import clause`, edit the `working_directory` and customize the `font`.

Move/copy the file `.windows/starship/starship.toml` to `C:\Users\Username\.config`


### Install WSL and a Linux distribution:
From the terminal: `wsl --install` then `wsl --install -d <DistroName>`

Run your distro, clone this repository and run the script `install.sh`.

# To reproduce the configuration on Linux

Clone this repository and run the script `install.sh`.

