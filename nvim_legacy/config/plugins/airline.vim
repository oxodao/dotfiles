" Setting the same theme as the whole vim
let g:airline_theme='dracula'

" Using the upper part of the screen to display the opened buffers
let g:airline#extensions#tabline#enabled = 1

" Using powerline-patched font so we can have fancy symbols
let g:airline_powerline_fonts = 1

" Choosing what will be displayed inside the powerline bar
let g:airline_section_y='BN: %{bufnr("%")}'
