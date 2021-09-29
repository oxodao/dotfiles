" Move around in buffer with the help of Shift + j/k, closing them with Shift + x
nnoremap <S-j> :bprev<CR>
nnoremap <S-k> :bnext<CR>
nnoremap <S-x> :bdelete<CR>

" Create a new line without going into normal mode
nmap <C-o> o<Esc>
nmap <C-S-o> O<Esc>

" Easily switch & move between windows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

nmap <silent> <A-K> :wincmd K<CR>
nmap <silent> <A-J> :wincmd J<CR>
nmap <silent> <A-H> :wincmd H<CR>
nmap <silent> <A-L> :wincmd L<CR>

nmap <silent> <C-A-j> :wincmd -<CR>
nmap <silent> <C-A-k> :wincmd +<CR>

" Changes the leader key to space
let mapleader="\<Space>"

" Hide the search highlighting by double tapping on space
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" Toggle the cursor-finding colors
nnoremap E :set cursorline! cursorcolumn!<CR>

" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Find and replace
nnoremap <C-H> :%s/
xnoremap <C-H> :s/

" Change current working directory locally and print cwd after that,
" see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <silent> <leader>cd :<C-U>lcd %:p:h<CR>:pwd<CR>

nnoremap <C-M-d> <C-x>
vnoremap <C-M-d> <C-x> gv
nnoremap <C-M-i> <C-a>
vnoremap <C-M-i> <C-a> gv
