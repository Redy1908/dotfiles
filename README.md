# Software i'm using
- [Alacritty](https://github.com/alacritty/alacritty)
- [Neovim](https://github.com/neovim/neovim)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Starship](https://github.com/starship/starship)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Lsd](https://github.com/lsd-rs/lsd)
- [Bat](https://github.com/sharkdp/bat)

# Configuration

This configuration is meant to be usend inside wsl2 on windows

### Windows Prerequisites
- Install a [nerd font](https://www.nerdfonts.com/font-downloads).
- Install [Alacritty](https://github.com/alacritty/alacritty).
- Install [Starship](https://github.com/starship/starship).
- Install [Ubuntu via wsl](https://learn.microsoft.com/en-us/windows/wsl/install)

### Set-up
- Start Ubuntu end clone this repository
- Edit the font name in `.windows/alacritty/alacritty.toml` according to the nerd font you installed
- Run the `./install.sh` script

- Note that the script will also configure neovim using [this](https://github.com/Redy1908/nvim) repository 
