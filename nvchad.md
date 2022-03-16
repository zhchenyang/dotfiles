# NvChad 简述

NvChad 是 nvim 的 IDE 工具套装?

## 开始

### 配置

预下载

* Neovim >= 0.6
* Nerd Font
* `ripgrep`

#### 下载

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
```

#### 更新

NvChad 提供了内置的更新命令：`<leader> uu`

#### 卸载

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

### Learn

tips

Vim tutor

```vim
:Tutor
```

In-build help docs

```vim
:h <cmd>
:h autocommand
:h vim.api
:h insert
```

#### 自定义设置

自定义设置保存在 `lua/custom` 路径下。与NvChad隔离出来，避免升级时覆盖设置。

* `custom/init.lua` gets run during NeoVim setup, it's a way to run general purpose code and run extensive NvChad modifications

* `custom/chadrc.lua` is used to override `core/default_config.lua`, you need to include values that you wish to change from the default file


**Install Treesitter Parser**

```vim
:TSInstall python
```

**Theming**

Swith themes with this mapping `<leader> + th`

### Learning Lua

```lua
-- printing
print('Hi')

-- comments
print('Hi') -- another comment

-- Variables
local x = 10 --number
local name = 'Sid' -- string
local isAlive = true -- boolean
local a = nil -- no value or invalid value

-- number
local a = 1
local b = 2

print(a+b) -- 3

-- increment
local level = 1
level = level + 1

-- string
local phrase = 'I am'
local name = 'Sid'
print(phase .. ' ' .. name)

-- string and number
local name = "NvChad"
print(name .. ' V' .. 1.0) -- NvChad V1.0
```

Comparison Operators

* `==` equality
* `<`
* `>`
* `<=`
* `>=`
* `~=` inequality

#### Conditional Statements

```lua
local age = 10
if not age <= 18 then
  print('over 18')
elseif age == 18 then
  print('18 huh')
else
  print('kiddo')
end
```

#### Functions

```lua
function num(a)
  print(a)
end

-- or 

local num = function(a)
  print(a)
end
```

#### Scope

Variables have diffrent scopes. Once the end of the scope is reached the value inthat in scope are on longer accessable

```lua
function foo()
  local n = 10
end

print(n) -- nil
```

#### Loops

Different ways to make a loop.

```lua
-- while
local i = 0

while i <= 3 do
  pritn('hi')
  i = i + 1
end

for i = 0, 3 do
  print('hi')
  i = i + 1
end

-- result
hi
hi
hi
```

#### Tables

```lua
-- Basic table
local colors = {'red', 'grenn', 'blue'}

print(colors[1])
print(colors[2])
print(colors[3])

for i = 1, #colors do
  print(colors[i])
end
```

Two dimensional Table

```lua
local data = {
  {'billy', 12},
  {'john', 20},
}

for i = 1, #data do
  print(data[i][1] .. 'is' .. data[i][1])
end
```

## config

### Walkthrouth

TODO

### Nvim lua stuff

#### Load file

_Suppose file is `~/.config/nvim/lua/core/chad.lua`._

Note that `lua` dir in your nvim config is already in the runtime!

```lua
require 'core.chad'
```

If you rename that `chad.lua` to `init.lua` 

```lua
require 'core'
```

#### Options

vimscript:

```vimscript
set mouse = a
```

lua:

```lua
vim.opt.mouse = 'a'
```

#### autocmds and augroups

```lua
vim.cmd 'augroup stuff'

-- multiline
vim.cmd([[
  stuff
  stuff
]])
```

#### globals

vimscript:

```vimscript
let g:autosave = true
```

lua:

```lua
vim.g.autosave = true
```

multiline global stuff

vimscript

```vimscript
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0
    \ }
```

lua:

```lua
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
  }
```

### Custom config

1. Create `custom` folder in `lua/`
2. The `chadrc.lua` here is for editing NvChad default options which are mentioned in `lua/core/default_config.lua` 
3. The `init.lua` here will be used for adding new plugins, new plugin config, replace default plugin config, adding new mappings. It's behaves like the `init.lua` in `~/config/nvim` 
4. check siduck's [custom config](https://github.com/siduck/dotfiles/tree/master/nvchad/custom) 

#### Adding pluigins

GO to the custom folder, make sure that every plugin definition is wrapped into a table.

```lua
-- /lua/custom/plugin/init.lua
return {
  {"elkowar/yuck.vim", ft = 'yuck'},
}
-- just an example!
```

```lua
-- /lua/custom/chadrc.lua
local userPlugins = require 'custom.plugins'

M.plugins = {
    install = userPlugins
}
```

#### Add mappings

```lua
local map = require('core.utils').map

map('n', '<leader>cc', ':Telescope <CR>')
map('n', '<leader>q', ':q <CR>')
```

#### _Replace_ default config of a plugin

1. using `default_plugin_config_replace` table in `chadrc.lua`
  
  ```lua
  M.plugins = {
      default_plugin_config_replace = {
          bufferline = 'custom.bufferline',
        },
    }
  -- NOTE: The 'bufferline' variable there is taken from the first argument here
  -- config = override_req("bufferline", "plugins.configs.bufferline", "setup")
  -- you will find that in the packer's bufferline use function
  -- make sure you do :PackerCompile or :PackerSync after this since the 
  -- packer_compiled.lua present needs to update
  ```
#### override default config of a plugin

Note: check 'default' table in your plugin's config and override a valid table inthe default table.

```lua
M.plugins = {
  default_plugin_config_replace = {
    nvim_treesitter = {
      ensure_installed = {
          'html',
          'css',
      },
    }
  }
}
```

note: the word 'nvim\_treesitter' is taken from the override function from `lua/plugins/init.lua`'s 'use' table.

The above method might get messy if you override many plugin configs, so below is a basic example to keep it clean

```lua
local pluginConfs = require 'custom.plugins.configs'

M.plugins = {
    default_plugin_config_replace = {
        nvim_treesitter = pluginConfs.treesitter,
        nvim_tree = pluginConfs.nvimtree
    },
}
```
```lua
-- /lua/custom/plugins/config.lua file

local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "html",
      "css",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "right",
      width = 20,
   },
}

return M
```

