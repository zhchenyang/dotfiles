-- 使用 packer.nvim 插件管理器
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- 加载 packer.nvim
require('packer').startup(function()
  -- packer.nvim 本身作为插件管理器
  use 'wbthomason/packer.nvim'

  -- 添加其他插件
  use 'tpope/vim-surround'
  use 'nvim-treesitter/nvim-treesitter'
  -- 更多插件...
end)
