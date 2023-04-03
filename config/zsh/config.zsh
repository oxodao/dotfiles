# Setting the theme
ZSH_THEME="mattboll"

# Auto-title is messing tmux's tab name
DISABLE_AUTO_TITLE="true"

# Using git plugin & one to auto-expand aliases
plugins=(git globalias virtualenv) # zsh-autosuggestions
source $ZSH/oh-my-zsh.sh

# Prevent some values from being extended
GLOBALIAS_FILTER_VALUES=(grep ls cat)

#bindkey '^ ' autosuggest-accept

unset PREFIX

# Err that should be automatic
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#autocmd BufNewFile,BufRead *.zshrc set syntax=zsh

export DOCKER_BUILDKIT=1
