" Most of theses came from https://github.com/jdhao/nvim-config/blob/nvim-lsp/core/autocommands.vim


" Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Automatically reload the file if it is changed outside of Nvim, see
" https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
" command does not work in command line. We need to check if we are in command
" line before executing this command. See also
" https://vi.stackexchange.com/a/20397/15292.
augroup auto_read
  autocmd!
  autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on disk. Buffer reloaded!", 'warn', {'title': 'nvim-config', 'timeout': 2500})
  autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" @TODO: This does not seems to work when not yanking a whole line
" Should make it work like in intellij

" highlight yanked region, see `:h lua-highlight`
augroup custom_highlight
  autocmd!
  autocmd ColorScheme * call s:custom_highlight()
augroup END

function! s:custom_highlight() abort
  " For yank highlight
  highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71

  " For cursor colors
  highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
  highlight Cursor2 guifg=red guibg=red

  " For floating windows border highlight
  highlight FloatBorder guifg=LightGreen guibg=NONE

  " highlight for matching parentheses
  highlight MatchParen cterm=underline gui=underline
endfunction

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankColor", timeout=300, on_visual=false}
augroup END

