function _zsh_setup_php() {
  export PATH=$PATH:$HOME/.config/composer/vendor/bin
}

_zsh_check_software PHP php php _zsh_setup_php
