-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Map Shift+Q/Shift+S to switch between buffers and Shift+X to close buffer
vim.keymap.set('n', 'Q', ':bp<CR>', { desc = 'Buffer précédent' })
vim.keymap.set('n', 'S', ':bn<CR>', { desc = 'Buffer suivant' })
vim.keymap.set('n', 'X', ':bd<CR>', { desc = 'Fermer le buffer' })
-- vim.keymap.set('n', 'X', ':bp<bar>bd<CR>')

vim.keymap.set('n', '<leader>"', ':vsplit<CR>', { desc = 'Diviser la fenêtre verticalement' })
vim.keymap.set('n', '<leader>%', ':split<CR>', { desc = 'Diviser la fenêtre horizontalement' })

vim.keymap.set({'n', 'i', 'x'}, '<C-l>', ':wincmd l<CR>', { desc = 'Fenêtre à droite' })
vim.keymap.set({'n', 'i', 'x'}, '<C-h>', ':wincmd h<CR>', { desc = 'Fenêtre à gauche' })
vim.keymap.set({'n', 'i', 'x'}, '<C-k>', ':wincmd k<CR>', { desc = 'Fenêtre au-dessus' })
vim.keymap.set({'n', 'i', 'x'}, '<C-j>', ':wincmd j<CR>', { desc = 'Fenêtre en dessous' })

-- Clear search with <space><space>
vim.keymap.set('n', '<leader><space>', ':nohl<CR>', { desc = 'Clear the search highlight' })

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard', noremap = true})
vim.keymap.set('v', '<leader>Y', '"+yg_', { desc = 'Copy to system clipboard', noremap = true})
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to system clipboard', noremap = true})
vim.keymap.set('n', '<leader>Y', '"+yg_', { desc = 'Copy to system clipboard', noremap = true})

-- Paste from clipboard
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard', noremap = true})
vim.keymap.set('v', '<leader>P', '"+P', { desc = 'Paste from system clipboard', noremap = true})
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard', noremap = true})
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Paste from system clipboard', noremap = true})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic sous le curseur' })
vim.keymap.set('n', '<leader>d', ':Telescope diagnostics<CR>', { desc = 'Rechercher les diagnostics' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.code_action, { desc = 'Actions de code LSP' })

-- Neotree
vim.keymap.set('n', '<C-d>', ':Neotree action=focus source=filesystem position=left toggle<CR>', {
  noremap = true,
  desc = 'Ouvrir / fermer l’explorateur de fichiers',
})
