# PATH FIRST
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cargo/bin"
export PATH="/Users/gaaelgarciia/.local/bin:$PATH"

# Homebrew initialization
eval "$(/opt/homebrew/bin/brew shellenv)"

# Environment
export JAVA_HOME="/opt/homebrew/opt/openjdk@23"
export PATH="$JAVA_HOME/bin:$PATH"

export EDITOR="nvim"
export CARGO_HOME="$HOME/.cargo"
export MANPATH="/Users/gaaelgarciia/.local/share/man:$MANPATH"

# Optional brew packages
export PATH="$(brew --prefix bison)/bin:$PATH"

# Prompt
eval "$(starship init zsh)"

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zoxide
eval "$(zoxide init zsh)"

# Aliases
alias tapa_on="sudo pmset disablesleep 0"
alias tapa_off="sudo pmset disablesleep 1"

alias ls="eza"
alias la="eza -a"
alias ll="eza -l"
alias lla="eza -l -a"

alias zed="open -a /Applications/Zed.app -n"

unsetopt inc_append_history

# OPAM
[[ ! -r '/Users/gaaelgarciia/.opam/opam-init/init.zsh' ]] || source '/Users/gaaelgarciia/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
