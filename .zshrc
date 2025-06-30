eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 

export JAVA_HOME="/opt/homebrew/opt/openjdk@23"
export PATH="$JAVA_HOME/bin:$PATH"

alias tapa_on="sudo pmset disablesleep 0"
alias tapa_off="sudo pmset disablesleep 1"
alias ls="eza"
alias la="eza -a"
alias ll="eza -l"
alias lla="eza -l -a"
eval "$(zoxide init zsh)"
unsetopt inc_append_history  # Opcional: Evita mensajes de historial
alias zed="open -a /Applications/Zed.app -n"

alias work="timer 50m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/gaaelgarciia/.opam/opam-init/init.zsh' ]] || source '/Users/gaaelgarciia/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# Following line was automatically added by arttime installer
export MANPATH=/Users/gaaelgarciia/.local/share/man:$MANPATH

# Following line was automatically added by arttime installer
export PATH=/Users/gaaelgarciia/.local/bin:$PATH
