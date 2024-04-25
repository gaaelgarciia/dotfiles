#!/bin/bash

# Update system and install essential packages
sudo pacman -Syu
sudo pacman -S --needed base-devel git

# Install specific packages
sudo pacman -S --needed kitty fzf git-delta btop neovim ripgrep tmux fish zoxide starship hyprland waybar wl-clipboard ranger nemo zathura 

chmod +x setup.sh
./setup.sh

