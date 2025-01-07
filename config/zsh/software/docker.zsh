function _zsh_setup_docker() {
  # docker kill all
  alias 'dka'='docker kill $(docker ps -q)'
  alias 'fckdc'='docker rm -f $(docker ps -a -q)'

  alias 'dc'='docker compose'

  # Those envvar are loaded on a per-project basis with the help of direnv

  export APP_CONTAINER=app

  # Generic aliases
  alias 'd'='docker compose exec $APP_CONTAINER'
  alias 'n'='docker compose exec $NODE_CONTAINER'
  alias 'dr'='docker compose run --rm $APP_CONTAINER'

  # Symfony-specific aliases
  alias 's'='docker compose exec $APP_CONTAINER bin/console '
  alias 'sr'='docker compose run --rm $APP_CONTAINER bin/console '

  # Django-specific aliases
  alias 'p'='docker compose exec $APP_CONTAINER python manage.py '
  alias 'pd'='docker compose exec $APP_CONTAINER python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py '
}

_zsh_check_software DOCKER docker docker _zsh_setup_docker
