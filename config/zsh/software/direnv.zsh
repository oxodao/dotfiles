function _zsh_setup_direnv() {
  eval "$(direnv hook zsh)"

  setopt PROMPT_SUBST

  show_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
      echo "($(basename $VIRTUAL_ENV))"
    fi
  }

  PS1='$(show_virtual_env)'$PS1
}

_zsh_check_software DIRENV direnv direnv _zsh_setup_direnv
