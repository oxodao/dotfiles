-- For nvim-tree, should be at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--------------

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.tarif",
  callback = function()
    vim.bo.syntax = "json"
  end,
})

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
-- require('plugins/nvimtree')
require('plugins/neotree')
require('plugins/vimwiki')
require('plugins/wilder')
require('plugins/which_key')

-- vim: ts=2 sts=2 sw=2 et
