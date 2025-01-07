# Minecraft
alias 'syncmc'='rsync -azv -P /opt/overflow/skcraft_ws/_upload/ o:~/mc/launcher/downloads/'
alias 'syncmcbs'='rsync -azv -P /opt/overflow/skcraft_ws/_upload/ o:~/mc/launcher/v2/downloads/'
alias 'syncmcg'='rsync -azv -P /opt/overflow/skcraft_ws/_upload/ o:~/mc/gamut/data/files/launcher/downloads/'
alias 'syncmcserv'='rsync -azv --exclude world --exclude backups --exclude logs --exclude journeymap --exclude crash-reports -P /opt/overflow/current_server/ o:~/mc/server/data'

# Calibre
alias 'synccalibre'='rsync -azv -P ~/Calibre\ Library/ o:~/calibreweb/books/'
