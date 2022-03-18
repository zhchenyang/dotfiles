-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "Q", ":q <CR>")
map("n", "W", ":w <CR>")

-- 快速分屏
map('n', 'sl', ':set splitright<CR>:vsplit<CR>')
map('n', 'sh', ':set nosplitright<CR>:vsplit<CR>')
map('n', 'sj', ':set splitright<CR>:split<CR>')
map('n', 'sk', ':set nosplitright<CR>:split<CR>')

-- 改变窗口大小
map('n', '<up>', ':res +5<CR>')
map('n', '<down>', ':res -5<CR>')
map('n', '<left>', ':vertical resize-5<CR>')
map('n', '<right>', ':vertical resize+5<CR>')

-- 快速移动
map('n', 'J', '5j')
map('n', 'K', '5k')


-------------------按键映射---------------------
-------------------杂项配置---------------------

-- 自动切换输入法配置
vim.o.ttimeoutlen=0

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
