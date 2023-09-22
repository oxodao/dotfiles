source $HOME/.config/zsh/aliases/docker.zsh
source $HOME/.config/zsh/aliases/folders.zsh
source $HOME/.config/zsh/aliases/git.zsh
source $HOME/.config/zsh/aliases/global.zsh

# Software specific aliases
alias ytmp3="yt-dlp -x --audio-format mp3 --audio-quality 0"
alias x=aunpack

alias ffmpeg_crop="ffmpeg -i INPUT -filter:v \"crop=out_w:out_h:x:y\" out.mp4"
alias ffmpeg_snap="ffmpeg -i INPUT -c:v libx265 -c:a aac -vf format=yuv420p -x265-params crf=25 out.mp4"
