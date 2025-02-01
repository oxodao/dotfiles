if [[ ${ZSH_IGNORE_JAVA:-0} != 1 ]]; then
  if [[ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
  else
    echo "SDKMAN (Java) is not installed. Install it or disable integration with 'export ZSH_IGNORE_JAVA=1' in ~/.zshrc.custom"
  fi
fi

