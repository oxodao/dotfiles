source $HOME/.config/zsh/aliases/docker.zsh
source $HOME/.config/zsh/aliases/folders.zsh
source $HOME/.config/zsh/aliases/git.zsh
source $HOME/.config/zsh/aliases/global.zsh

alias ffmpeg_crop="ffmpeg -i INPUT -filter:v \"crop=out_w:out_h:x:y\" out.mp4"
