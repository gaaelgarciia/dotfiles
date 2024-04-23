#!/bin/bash

# Copy configuration files
cp -r .config/ ~/.config/

# Install vim-plug
nvim +PlugInstall +qall

