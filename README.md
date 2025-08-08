# Dotfiles

This repository contains my personal dotfiles configuration for both macOS and Linux systems.

## Features

- Zsh configuration with useful aliases and plugins
- Starship prompt configuration
- Neovim setup
- macOS-specific settings
- Cross-platform installation script

## Prerequisites

- Git
- Bash

## Installation

1. Clone this repository:

   ```
   git clone https://github.com/yourusername/dotfiles.git
   cd dotfiles
   ```

2. Run the installation script:

   ```
   bash install.sh
   ```

   This script will:

   - Install necessary packages using the appropriate package manager (Homebrew for macOS, apt or dnf for Linux)
   - Set up Zsh as the default shell
   - Install Zsh plugins
   - Copy configuration files to the appropriate locations
   - Set up Neovim
   - Apply macOS-specific settings (if on macOS)

3. Restart your terminal or run `source ~/.zshrc` to apply the changes.

## Customization

Feel free to modify the configuration files to suit your needs:

- Zsh configuration: `.config/zsh/.zshrc`
- Starship prompt configuration: `.config/starship/starship.toml`
- macOS settings: `macos_setup.sh`
- Package list: `packages.txt`

## Included Tools

The `packages.txt` file contains a list of all tools that will be installed. Some key tools include:

- zsh: Shell
- starship: Cross-shell prompt
- neovim: Text editor
- fzf: Fuzzy finder
- bat: Cat clone with syntax highlighting
- exa: Modern replacement for ls
- ripgrep: Fast grep alternative

To add or remove tools, simply edit the `packages.txt` file before running the installation script.

## Uninstalling

To remove the dotfiles setup:

1. Delete the created configuration files and directories:

   ```
   rm -rf ~/.config/zsh ~/.config/starship ~/.config/nvim ~/.zsh
   ```

2. Remove the installed packages using your system's package manager.

3. Change your default shell back to bash:
   ```
   chsh -s $(which bash)
   ```

## License

This project is open source and available under the [MIT License](LICENSE).
