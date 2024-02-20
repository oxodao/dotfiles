-- For nvim-tree, should be at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--------------

require('plugins')
require('settings')
require('keybinds')

require('plugins/lualine')
require('plugins/bufferline')
require('plugins/comment')
require('plugins/highlightundo')
require('plugins/indentline')
require('plugins/telescope')
require('plugins/treesitter')
require('plugins/lsp')
require('plugins/nvimcmp')
require('plugins/nvimtree')
require('plugins/vimwiki')
require('plugins/wilder')

-- vim: ts=2 sts=2 sw=2 et

-- Use this if you want it to automatically show all diagnostics on the
-- current line in a floating window. Personally, I find this a bit
-- distracting and prefer to manually trigger it (see below). The
-- CursorHold event happens when after `updatetime` milliseconds. The
-- default is 4000 which is much too long
-- vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
-- vim.o.updatetime = 800

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
  { noremap = true, silent = true }
)

