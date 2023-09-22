# docker kill all
alias 'dka'='docker kill $(docker ps -q)'
alias 'fckdc'='docker rm -f $(docker ps -a -q)'

alias 'dc'='docker compose'

# Those envvar are loaded on a per-project basis with the help of direnv
alias 'd'='docker compose exec $PHP_CONTAINER'
alias 's'='docker compose exec $PHP_CONTAINER bin/console '
alias 'p'='docker compose exec $PHP_CONTAINER python manage.py '
alias 'pd'='docker compose exec $PHP_CONTAINER python -m debugpy --wait-for-client --listen 0.0.0.0:5678 manage.py '
alias 'n'='docker compose exec $NODE_CONTAINER'

alias 'dr'='docker compose run --rm $PHP_CONTAINER'
alias 'sr'='docker compose run --rm $PHP_CONTAINER bin/console '


# that thing there 
alias k=kubectl
alias kp="kubectl proxy"
alias kl="kubectl --kubeconfig ~/.kube/lupin"
alias klp="kubectl --kubeconfig ~/.kube/lupin proxy"
