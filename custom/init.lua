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
map('n', 'J', '<C-d>')
map('n', 'K', '<C-u>')

-- copilot
--  imap <silent><script><expr> <C-L> copilot#Accept()
--  let g:copilot_no_tab_map = v:true
map('i', '<C-b>', 'copilot#Accept()', { script = true, expr = true, silent = true} )
vim.g.copilot_no_tab_map = 1
-- TODO
-- fix cmp and copilot conflict

-- neoterm config
map('n', '<leader><leader>', ':Ttoggle<CR>')
map('n', '<leader><Enter>', ':TREPLSendLine<CR>')
map('v', '<C-j>', ':TREPLSendSelection<CR>')
map('n', 'gx', '<Plug>(neoterm-repl-send)')
map('v', 'gx', '<Plug>(neoterm-repl-send)')
map('n', 'gn', '<Plug>(neoterm-repl-send-line)')
map('v', 'gn', '<Plug>(neoterm-repl-send-line)')


-------------------按键映射---------------------
-------------------杂项配置---------------------

-- 自动切换输入法配置
vim.o.ttimeoutlen=0
vim.g.python3_host_prog = '/usr/local/Caskroom/miniconda/base/envs/ds/bin/python'

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it

-- macos 输入法切换
-- requires xkbswitch-macosx
-- curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
vim.g.barbaric_ime = 'macos'
vim.g.barbaric_default = 0
vim.g.barbaric_scope = 'buffer'
vim.g.barbaric_timeout = '-1'


-- R markdown
vim.g.markdown_fenced_langues = {'python'}
vim.g.rmd_fenced_languages = {"r", "python"}
vim.g.rmd_syn_hl_chunk = 1

-- Neoterm repl
vim.g.neoterm_default_mod = 'vertical'
vim.g.neoterm_repl_python = {
  'conda activate ds', 'ipython'
}
vim.g.neoterm_repl_enable_ipython_paste_magic = 1
vim.g.neoterm_bracketed_paste = 1
vim.g.neoterm_repl_command = {
  'conda activate ds', 'radian'
}

-- abbr
local cmd = vim.cmd
cmd [[iabbr 点点点 ...]]
cmd [[iabbr teh the]]
cmd [[iabbr 小点 .]]
cmd [[iabbr 反引号 ``<Left>]]
