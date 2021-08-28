nnoremap <C-p> :CtrlP

" Ignoring files that should not be appearing in the fuzzy finder
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|out)$'
            \ }
