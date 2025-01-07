# First we load the zsh.custom for the config vars
if [ -f ~/.zshrc.custom ]; then
	source ~/.zshrc.custom
fi

# We add the custom scripts
PATH=$PATH:$HOME/.local/bin:$HOME/.config/zsh/scripts

# We set the OMZ config path
export ZSH=$HOME/.oh-my-zsh

# And we load the real config
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/aliases.zsh

# Software specific
source $HOME/.config/zsh/fn_check_software.zsh

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

# If there is a zsh_custom_post method defined in the ~/.zsh.custom file
# we execute it at the end
if typeset -f zsh_custom_post > /dev/null 2>&1; then
  zsh_custom_post
fi

# Display the memo file
source $HOME/.config/zsh/memo.zsh
