PATH=$PATH:$HOME/.config/zsh/scripts
source $HOME/.config/zsh/global.zsh

alias 'syncmc'='rsync -azv /opt/mc/ws/_upload/ o:/home/oxodao/mc/launcher/downloads/'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
