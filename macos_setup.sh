#!/bin/bash

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool true

# Set keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

# Finder settings
defaults write com.apple.finder CreateDesktop -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true

# Trackpad: enable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Install Xcode Command Line Tools
xcode-select --install

echo "macOS settings have been updated. Some changes may require a logout/restart to take effect."
