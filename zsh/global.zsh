export ZSH=$HOME/.oh-my-zsh

source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/memo.zsh
source $HOME/.config/zsh/keyring.zsh

# Languages specific
source $HOME/.config/zsh/python.zsh

source $HOME/.config/zsh/direnv.zsh
source $HOME/.config/zsh/tools.zsh

# Docker
export DOCKER_BUILDKIT=1

# At the end so it overrides the default setup
if [ -f ~/.zshrc.custom ]; then
    source ~/.zshrc.custom
else
    print "Could not find the machine specific zshrc (~/.zshrc.custom)"
fi
