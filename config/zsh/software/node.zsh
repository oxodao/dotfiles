if [[ ${ZSH_IGNORE_NODE:-0} != 1 ]]; then
  if [[ -f $HOME/.nvm/nvm.sh ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  else
    echo "NVM (NodeJS Version Mananger) is not installed. Install it or disable integration with 'export ZSH_IGNORE_NODE=1' in ~/.zshrc.custom"
  fi
fi

