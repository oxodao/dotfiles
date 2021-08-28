let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1

" Lets you use tab for switching between proposals
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close the preview after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


