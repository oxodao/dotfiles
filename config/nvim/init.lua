-- For nvim-tree, should be at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--------------

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.tarif',
  callback = function()
    vim.bo.syntax = 'json'
  end,
})

require('settings')
require('keybinds')
require('config.lazy')

-- vim: ts=2 sts=2 sw=2 et
