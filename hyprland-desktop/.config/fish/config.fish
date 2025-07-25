if status is-interactive
    alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
    alias clase-Q4='cd $HOME/Desktop/Q4'
    alias clase-Q3='cd $HOME/Desktop/Q3'
    set -g fish_greeting
    starship init fish | source
    zoxide init fish | source
    alias ls=eza
    export EDITOR=nvim
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2024-05-24 15:49:24
set PATH $PATH /home/gaaelgarciia/.local/bin
