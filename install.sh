#!/bin/bash

set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install packages based on the OS
install_packages() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command_exists brew; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew update
        while IFS= read -r package; do
            brew install "$package"
        done < packages.txt
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command_exists apt-get; then
            sudo apt-get update
            while IFS= read -r package; do
                sudo apt-get install -y "$package"
            done < packages.txt
        elif command_exists dnf; then
            sudo dnf update
            while IFS= read -r package; do
                sudo dnf install -y "$package"
            done < packages.txt
        else
            echo "Unsupported Linux distribution. Please install the required packages manually."
            exit 1
        fi
    else
        echo "Unsupported operating system"
        exit 1
    fi
}

# Install packages
install_packages

# Create necessary directories
mkdir -p ~/.config/zsh ~/.config/starship ~/.zsh

# Copy configuration files
cp .config/zsh/.zshrc ~/.zshrc
cp .config/starship/starship.toml ~/.config/starship/starship.toml

# Set up Zsh as the default shell
if [[ "$SHELL" != *"zsh"* ]]; then
    echo "Setting Zsh as the default shell..."
    chsh -s $(which zsh)
fi

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# Set up Neovim
mkdir -p ~/.config/nvim
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc' > ~/.config/nvim/init.vim

# macOS-specific setup
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running macOS-specific setup..."
    bash macos_setup.sh
fi

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
