alias 'syncmc'='rsync -azv -P /opt/overflow/skcraft_ws/_upload/ o:~/mc/launcher/downloads/'
alias 'syncmcg'='rsync -azv -P /opt/overflow/skcraft_ws/_upload/ o:~/mc/gamut/data/files/launcher/downloads/'

alias 'syncmcpp'='rsync -azv -P /opt/overflow/skcraft_pp_ws/_upload/ o:~/mc/launcher-pp/downloads/'

alias 'syncmcserv'='rsync -azv --exclude world --exclude backups --exclude logs --exclude journeymap --exclude crash-reports -P /opt/overflow/current_server/ o:~/mc/server/data'

alias 'synccalibre'='rsync -azv -P ~/Calibre\ Library/ o:~/calibreweb/books/'
