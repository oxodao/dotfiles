PATH=$PATH:$HOME/.config/zsh/scripts
source $HOME/.config/zsh/global.zshrc
source $HOME/.zshrc.custom
fpath+=${ZDOTDIR:-~}/.zsh_functions

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias 'syncmc'='rsync -azv /opt/mc/ws/_upload/ o:/home/oxodao/mc/launcher/downloads/'
