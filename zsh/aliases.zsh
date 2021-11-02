source $HOME/.config/zsh/aliases/docker.zsh
source $HOME/.config/zsh/aliases/folders.zsh
source $HOME/.config/zsh/aliases/git.zsh
source $HOME/.config/zsh/aliases/global.zsh

# Software specific aliases
alias ytmp3="youtube-dl -x --audio-format mp3 --audio-quality 0"
alias x=aunpack

alias ffmpeg_crop="ffmpeg -i INPUT -filter:v \"crop=out_w:out_h:x:y\" out.mp4"
