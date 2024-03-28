if status is-interactive
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    set -g fish_greeting
    starship init fish | source
    # Commands to run in interactive sessions can go here
end
