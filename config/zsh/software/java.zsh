function _zsh_setup_java() {
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}

_zsh_check_software JAVA sdk "SDKMAN (Java)" _zsh_setup_java
