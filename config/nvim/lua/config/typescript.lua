local M = {}

-- TypeScript 7 ships a native LSP instead of the JavaScript tsserver.
-- Search upwards to support dependencies hoisted to a workspace root.
function M.on_new_config(config, root_dir)
  local package_file = vim.fs.find('node_modules/typescript/package.json', {
    path = root_dir,
    upward = true,
    type = 'file',
  })[1]
  if not package_file then
    return
  end

  local ok, package = pcall(function()
    return vim.json.decode(table.concat(vim.fn.readfile(package_file), '\n'))
  end)
  if not ok or type(package) ~= 'table' then
    return
  end

  local major = tonumber((package.version or ''):match('^(%d+)'))
  if not major or major < 7 then
    return
  end

  local executable = vim.fs.dirname(package_file) .. '/bin/tsc'
  if vim.fn.filereadable(executable) == 0 then
    return
  end

  config.cmd = { 'node', executable, '--lsp', '--stdio' }
  config.init_options = vim.empty_dict()
end

return M
