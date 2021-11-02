alias "vim"="nvim"

# Some basic aliases
alias ls=exa
alias 'l'='ls -lah'
alias 'edi3'='vim ~/.config/i3/config && i3-msg restart'
alias 'cd..'='cd ..'
alias ':q'='exit'
alias 'svim'='sudo vim'
alias "git add ."="git commit -A"

# Some docker related aliases
alias 'dka'='docker kill $(docker ps -q)'

# Those envvar are loaded on a per-project basis with the help of direnv
alias 'd'='docker-compose exec $PHP_CONTAINER'
alias 'dr'='docker-compose run $PHP_CONTAINER'
alias 'n'='docker-compose exec $NODE_CONTAINER'
alias 's'='docker-compose exec $PHP_CONTAINER bin/console '
alias 'sr'='docker-compose run $PHP_CONTAINER bin/console '

alias 'dc'='docker-compose'
alias composer='docker run --rm --interactive --tty --volume `pwd`:/app --volume ${COMPOSER_HOME:-$HOME/.composer}:/tmp composer'

# Fixing ADB
alias 'fixadb'='sudo adb kill-server && sudo adb devices'

# Some folder shortcuts
alias 'g'='cd ~/Git'
alias 'sf'='cd ~/Git/Spacefoot/ebiz'

# Useful shortcuts
alias "syncprogress"="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias "logout"="i3-msg exit"

# Software specific aliases
alias ytmp3="youtube-dl -x --audio-format mp3 --audio-quality 0"
alias "lzd"="lazydocker"
alias x=aunpack

alias ffmpeg_crop="ffmpeg -i INPUT -filter:v \"crop=out_w:out_h:x:y\" out.mp4"
