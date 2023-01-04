iab <expr> cdate strftime('%Y-%m-%d')
iab <expr> ctime strftime('%H:%M:%S')
iab <expr> cdatetime strftime('%Y-%m-%d - %H:%M:%S')

iab @@ nathan@janczewski.fr

" Insert a UUID when running the command :uuidgen
cab uuid r! uuidgen

" Write the current working directory
cab pwd r! pwd
