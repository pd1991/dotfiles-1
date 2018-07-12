# Allow completing of the remainder of a command
# bindkey "^N" insert-last-word

bindkey -v
export KEYTIMEOUT=1

# Need to state explicitly because we binded vim keys. Ugh.
bindkey '^R' history-incremental-search-backward

# Backspace does not work if you enable vi-mode. Hack.
# See
# https://github.com/denysdovhan/spaceship-prompt/issues/91#issuecomment-327996599
bindkey "^?" backward-delete-char

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Enable completion
autoload -U compinit
compinit

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# Sourcing of other files
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/functions
source $HOME/.dotfiles/zsh/prompt
source $HOME/.dotfiles/zsh/z

# Add cabal bin
export PATH=$PATH:~/.cabal/bin

# Add current directory bin
export PATH=$PATH:bin

# Add my own dotfiles bin
export PATH=$PATH:$HOME/.dotfiles/bin

# RVM
[[ -s "/Users/pradyumna/.rvm/scripts/rvm" ]] && source "/Users/pradyumna/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Oracle Client Libraries
export OCI_DIR=/opt/oracle/instantclient_12_1
export SQLPATH=/opt/oracle/instantclient_12_1
export ORACLE_HOME=/opt/oracle/instantclient_12_1
export ORACLE_SYSTEM_PASSWORD=standard1
export NLS_LANG=AMERICAN_AMERICA.UTF8
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# EBA
export EBA_SRC_DIR=$HOME/code/eba
export EBA_INTAKE_SRC_DIR=$HOME/code/eba_intake

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

