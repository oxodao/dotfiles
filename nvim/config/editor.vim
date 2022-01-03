syntax on
filetype plugin indent on
set encoding=utf8
set nocompatible
set undofile

" When splitting the screen, it will split below by default instead of
" side-by-side
set splitbelow

set conceallevel=1
set linebreak

" Allows switching buffer without saving
set hidden

" Show line numbers relatively to current line
set nu relativenumber

" Always have at least 10 lines between the current one and the border of the screen
set so=10

" Displays both tabulations, space and end of line
set listchars=eol:_,tab:>-,trail:~,extends:>,precedes:<
set list

set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

set incsearch

let b:match_words = '\s*#\s*region.*$:\s*#\s*endregion'
