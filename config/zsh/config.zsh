# Setting the theme
ZSH_THEME="mattboll"

# Auto-title is messing tmux's tab name
DISABLE_AUTO_TITLE="true"

# Using git plugin & one to auto-expand aliases
plugins=(git globalias virtualenv) # zsh-autosuggestions
source $ZSH/oh-my-zsh.sh

# Prevent some values from being extended
GLOBALIAS_FILTER_VALUES=(grep ls cat)

unset PREFIX

# Err that should be automatic
export EDITOR=vim
export DOCKER_BUILDKIT=1
