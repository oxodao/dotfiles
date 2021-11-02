# docker kill all
alias 'dka'='docker kill $(docker ps -q)'

alias 'dc'='docker-compose'

# Those envvar are loaded on a per-project basis with the help of direnv
alias 'd'='docker-compose exec $PHP_CONTAINER'
alias 's'='docker-compose exec $PHP_CONTAINER bin/console '
alias 'n'='docker-compose exec $NODE_CONTAINER'

alias 'dr'='docker-compose run --rm $PHP_CONTAINER'
alias 'sr'='docker-compose run --rm $PHP_CONTAINER bin/console '

