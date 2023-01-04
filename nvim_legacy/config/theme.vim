" Always show tabline, no clue what's exactly doing though it is required for Vim-Airline
set showtabline=2
set laststatus=2

" Hides the -- INSERT -- and lets the vim-airline plugin do it
set noshowmode

set termguicolors
colorscheme dracula

" Setting background color for line and column on which the cursor is, to be found easily (Toggle with Shit+e)
hi CursorLine   cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0

