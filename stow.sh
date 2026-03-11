#!/bin/sh

echo "Select the desired config: [1] macos [2] sway [3] i3 [4] general"
read option

if [$option = 1]; then 
    cd macos 
    stow .
fi 
if [$option = 2]; then 
    cd i3wm-x220
    stow .
fi 
if [$option = 3]; then 
    cd sway-desktop 
    stow .
fi 
if [$option = 4]; then 
    cd general 
    stow -d . -t ~/.config
fi
