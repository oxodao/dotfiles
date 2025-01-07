# @TODO: Add a custom script with autocompletion in my dotfiles instead of aliases

alias ffcrop="ffmpeg -i INPUT -filter:v \"crop=out_w:out_h:x:y\" out.mp4"
alias ffsnap="ffmpeg -i INPUT -c:v libx265 -c:a aac -vf format=yuv420p -x265-params crf=25 out.mp4"
