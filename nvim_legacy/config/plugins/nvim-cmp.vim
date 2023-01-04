lua <<EOF

local cmp = require('cmp')

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete()
    }
})

EOF
