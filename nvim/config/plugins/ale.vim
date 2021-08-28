" Go through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Keep the column opened so that the text does not shift around while typing
let g:ale_sign_column_always = 1

" Better characters
let g:ale_sign_error = '⚑'
let g:ale_sign_warning = '⚐'

" Better formatting for errors
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Magenta bg on errors
highlight ALEWarning ctermbg=DarkMagenta


