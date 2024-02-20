export ZSH=$HOME/.oh-my-zsh

source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/aliases.zsh

export PATH=$PATH:$HOME/.local/bin

source $HOME/.config/zsh/memo.zsh

# Software specific
source $HOME/.config/zsh/software/direnv.zsh
source $HOME/.config/zsh/software/docker.zsh
source $HOME/.config/zsh/software/ffmpeg.zsh
source $HOME/.config/zsh/software/git.zsh
source $HOME/.config/zsh/software/go.zsh
source $HOME/.config/zsh/software/java.zsh
source $HOME/.config/zsh/software/keyring.zsh
source $HOME/.config/zsh/software/node.zsh
source $HOME/.config/zsh/software/php.zsh
source $HOME/.config/zsh/software/rsync.zsh

# WSL-specific stuff
if uname -r | grep -q 'microsoft'; then
	source $HOME/.config/zsh/wsl.zsh
fi

if [ -f ~/.zshrc.custom ]; then
	source ~/.zshrc.custom
fi