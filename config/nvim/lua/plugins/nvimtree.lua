-- Kept as an optional alternative to Neo-tree.
return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sort_by = 'case_sensitive',
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    update_focused_file = {
      enable = true,
    },
  },
}
