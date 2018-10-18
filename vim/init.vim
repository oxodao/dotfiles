if !has('nvim')
	" Turning on truecolors to be used outside of tmux/neovim
	set t_8b=^[[48;2;%lu;%lu;%lum
	set t_8f=^[[38;2;%lu;%lu;%lum
endif

""""" Plugin installation (Through vim-plug)
call plug#begin()
	" Color theme
	Plug 'tomasr/molokai'
	Plug 'yuttie/hydrangea-vim'

	" Bottom bar which has the powerline thingy thing
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" One neat fuzzy file opener
	Plug 'ctrlpvim/ctrlp.vim'

	" Automatically close your parenthesis, brackets and such
	Plug 'Raimondi/delimitMate'

	" Shows your vars and functions in a bar
	" Uses ctags, same goal as the Overview window in eclipse
	" Also it's PHP companion
	Plug 'majutsushi/tagbar'
	Plug 'vim-php/tagbar-phpctags.vim' " This one requires phpctags installed!

	" Automatically generate getters and setters in PHP
	Plug 'docteurklein/php-getter-setter.vim'

	" Emmet for vim, Generate HTML tags with CSS syntax
	Plug 'mattn/emmet-vim'

	" Tree file finder and it's Git companion plugin
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Add nice icons, but requires one of those fonts: https://nerdfonts.com
	" I personally use Hack
	Plug 'ryanoasis/vim-devicons'

	" If your termial is truecolors-compliant, this plugin lets you
	" preview CSS/HEX colors straight in vim
	Plug 'chrisbra/Colorizer'

	" Lots of languages support
	Plug 'sheerun/vim-polyglot'

    " JS (even though it's already in vim polyglot & everything for react
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'


	Plug 'donRaphaco/neotex', { 'for': 'tex' }

	" Error checker (Like Syntastic)
	Plug 'w0rp/ale'

	" PHP Code completions
	Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

	" JS Code completions
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

	" Easy way of toggling comments
	Plug 'tomtom/tcomment_vim'

	" Vim-surround
	Plug 'tpope/vim-surround'

    " The thing to move quick
    Plug 'easymotion/vim-easymotion'

    " Better f/F
    Plug 'rhysd/clever-f.vim'

    " Auto-opens diff & status window while comitting on git
    Plug 'rhysd/committia.vim'

    " Concats all text object
    Plug 'kana/vim-textobj-user'
    Plug 'rhysd/vim-textobj-anyblock'

	" Code completion (Requires Python3 enabled vim or neovim)
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		Plug 'roxma/nvim-yarp'
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif

call plug#end()

"""" Setting up the editor """""
" Turning on syntax highlighting
syntax on

" Setting the editor to detect the file type
filetype plugin indent on

" Let vim use UTF-8 so that we can see the nice icons
set encoding=utf8

" Allows switching buffer without saving
set hidden

" Removes old VI habits (Should already be done in neovim though)
set nocompatible

" Show line numbers relatively to current line
set nu
set relativenumber

" Always have at least 10 lines between the current one and the border of the screen
set so=10

" Displays both tabulations, space and end of line
set listchars=eol:_,tab:>-,trail:~,extends:>,precedes:<
set list

" Always show tabline, no clue what's exactly doing though it is required for Vim-Airline
set showtabline=2

" Also required for vim-airline, no clue what it is neither
set laststatus=2

" Hides the -- INSERT -- and lets the vim-airline plugin do it
set noshowmode

" Setting truecolors support
set termguicolors

" Setting the color theme (Requires the plugin installation to be done)
colorscheme hydrangea

" Setting background color for line and column on which the cursor is, to be found easily (Toggle with Shit+e)
hi CursorLine   cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0

" Preserves the undo history
set undofile

" Vim tries to automatically continue numbered lists, and automatically tries to remove leading * when you delete one line in comments
set formatoptions+=nj

" Automatically opens window under instead of on the top
set splitbelow

" Set the conceal level
set conceallevel=1

" Errr lets have space instead of tab, just so I dont mess up my compagny's code
set expandtab
set tabstop=4
set shiftwidth=4

""""" Setting keybinds """""
""" Standard vim keybindings
" Move around in buffer with the help of Shift + j/k, closing them with Shift + x
nnoremap <S-j> :bprev<CR>
nnoremap <S-k> :bnext<CR>
nnoremap <S-x> :bdelete<CR>

" Back one word to Shift W

" Create a new line without going into insert
nmap <C-o> o<Esc>
nmap <C-S-o> O<Esc>

" Prevent myself using arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" Compile LaTeX documents
nnoremap <silent> <Leader>p :!pdflatex %<CR>

" Toggle the cursor-finding colors
nnoremap E :set cursorline! cursorcolumn!<CR>

" Automatically switch between CPP and H files
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Toggle conceal level
map <leader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

""" Nvim specific config
if has('nvim')
	" Double Ctrl + x exit the terminal (Much easier on an azerty keyboard)
	tnoremap <C-x><C-x> <C-\><C-n>
endif

""" Plugins keybindings
"" CtrlP
nnoremap <C-p> :CtrlP

"" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>

"" Eclim
" Automatically import everything (Same shortcut as in eclipse I think)
" nnoremap <C-S-o> :JavaImportOrganize<CR>

"" ALE
" Go through errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""""" Plugin config """""
"" vim-javascript
" Highlighting the JSDocs
let g:javascript_plugin_jsdoc=1

" Setting a few characters for concealing
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"

"" vim-airline
" Setting the same theme as the whole vim
let g:airline_theme='molokai'
" Let's also use correct colors for the conceal
highlight Conceal guifg=#32C2BC guibg=#134242

" Using the upper part of the screen to display the opened buffers
let g:airline#extensions#tabline#enabled = 1

"Using powerline-patched font so we can have fancy symbols
let g:airline_powerline_fonts = 1

" Choosing what will be displayed inside the powerline bar
let g:airline_section_y='BN: %{bufnr("%")}'

"" CPP-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"" CtrlP
" Ignoring files that should not be appearing in the fuzzy finder
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll|o|out)$'
			\ }


"" Deoplete
" Automatically runs deoplete on startup
let g:deoplete#enable_at_startup = 1

" Required for vim apparently
let g:deoplete#enable_yarp = 1

" Lets you use tab for switching between proposals
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close the preview after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"" ALE
" Keep the column opened so that the text does not shift around while typing
let g:ale_sign_column_always = 1

" Better characters
let g:ale_sign_error = '⚑'
let g:ale_sign_warning = '⚐'

" Better formatting for errors
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Magenta bg on errors
highlight ALEWarning ctermbg=DarkMagenta

"" Colorizer
" Automatically applies the color in those kind of files
let g:colorizer_auto_filetype='css,html,twig'

" Auto sudo write
cmap w!! w !sudo tee > /dev/null %
