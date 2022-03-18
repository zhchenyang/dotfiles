local M = {}

M.cmp = {
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false })
  }
}

M.treesitter = {
  ensure_installed = {
    'lua',
    'vim',
    'html',
    'markdown',
    'bash',
    'python',
    'r',
    'json',
  },
  -- sync_install = true
}

return M
