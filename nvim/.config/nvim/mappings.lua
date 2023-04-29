local map = vim.api.nvim_set_keymap

-- 基本映射示例
map('n', '<leader>w', ':write<CR>', {noremap = true, silent = true})
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})
