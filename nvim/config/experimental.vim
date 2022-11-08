" Everything there is still in testing phase, not sure if they'll stay

" Move block code when in visual with J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle invisble chars
nmap <leader>l :set list! nu! rnu!<CR>

" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c
