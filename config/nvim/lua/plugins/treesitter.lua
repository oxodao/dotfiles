return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  -- New API, compatible with the installed tree-sitter CLI 0.25.x.
  -- Newer revisions require CLI 0.26.1+.
  commit = 'a3b489680f2fc0620e1025584f72e90a1fa6eb3b',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  },
  config = function()
    local treesitter = require('nvim-treesitter')
    treesitter.setup({
      -- Avoid reusing parsers/queries installed with the old master API.
      install_dir = vim.fn.stdpath('data') .. '/treesitter',
    })
    treesitter.install({
      'arduino',
      'c',
      'c_sharp',
      'cmake',
      'comment',
      'cpp',
      'csv',
      'dockerfile',
      'gitcommit',
      'go',
      'html',
      'javascript',
      'json',
      'json5',
      'jsdoc',
      'latex',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'php',
      'phpdoc',
      'python',
      'regex',
      'scss',
      'sql',
      'ssh_config',
      'tsx',
      'twig',
      'typescript',
      'udev',
      'vim',
      'xml',
      'yaml',
    })

    local group = vim.api.nvim_create_augroup('Treesitter', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      callback = function(args)
        if vim.bo[args.buf].buftype ~= '' then
          return
        end
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then
          return
        end
        local ok, loaded = pcall(vim.treesitter.language.add, lang)
        if not ok or not loaded then
          return
        end
        vim.treesitter.start(args.buf, lang)
        if vim.bo[args.buf].filetype ~= 'python' then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require('nvim-treesitter-textobjects').setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })
    for keys, capture in pairs({
      aa = '@parameter.outer',
      ia = '@parameter.inner',
      af = '@function.outer',
      ['if'] = '@function.inner',
      ac = '@class.outer',
      ic = '@class.inner',
    }) do
      vim.keymap.set({ 'x', 'o' }, keys, function()
        require('nvim-treesitter-textobjects.select').select_textobject(capture, 'textobjects')
      end, { desc = 'Sélection Treesitter : ' .. capture })
    end
    for method, mappings in pairs({
      goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
      goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
      goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
    }) do
      for keys, capture in pairs(mappings) do
        vim.keymap.set({ 'n', 'x', 'o' }, keys, function()
          require('nvim-treesitter-textobjects.move')[method](capture, 'textobjects')
        end, { desc = 'Treesitter : ' .. method .. ' ' .. capture })
      end
    end
    vim.keymap.set('n', '<leader>a', function()
      require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
    end, { desc = 'Échanger avec le paramètre suivant' })
    vim.keymap.set('n', '<leader>A', function()
      require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')
    end, { desc = 'Échanger avec le paramètre précédent' })

    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.o.foldenable = false -- Disable fold on startup
  end,
}
