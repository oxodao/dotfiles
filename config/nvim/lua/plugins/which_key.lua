return {
  'folke/which-key.nvim',
  version = '^3',
  opts = {
    preset = 'modern',
    delay = 300,
    icons = { mappings = false },
    spec = {
      { '<leader>s', group = 'Recherche' },
      { '<leader>w', group = 'Espaces de travail LSP' },
      {
        '<leader>?',
        function()
          require('which-key').show({ global = true })
        end,
        desc = 'Afficher les raccourcis',
        mode = { 'n', 'v' },
      },
    },
  },
}
