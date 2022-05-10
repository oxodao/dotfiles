" Auto install vim-plug
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'Raimondi/delimitMate'
    Plug 'chrisbra/Colorizer'
    Plug 'sheerun/vim-polyglot'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'w0rp/ale'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-surround'
    Plug 'rhysd/clever-f.vim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'nvim-lua/completion-nvim'

    " Lets get a real IDE
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-buffer'

    Plug 'editorconfig/editorconfig-vim'
call plug#end()

""""""""""""""""""""""""""
"" Required lsp servers ""
""""""""""""""""""""""""""

" :LspInstall html
" :LspInstall css
" :LspInstall json
" :LspInstall typescript
" :LspInstall python
" :LspInstall go
" :LspInstall php

source <sfile>:h/plugins/airline.vim
source <sfile>:h/plugins/ale.vim
source <sfile>:h/plugins/colorizer.vim
source <sfile>:h/plugins/deoplete.vim
source <sfile>:h/plugins/telescope.vim
source <sfile>:h/plugins/nvim-tree.vim

source <sfile>:h/plugins/lsp.vim
source <sfile>:h/plugins/nvim-cmp.vim

autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion

set shortmess+=c
