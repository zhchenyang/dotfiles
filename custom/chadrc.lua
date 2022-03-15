-- IMPORTANT NOTE : This is default config, so dont change anything here.
-- use custom/chadrc.lua instead

local M = {}

M.options = {
   relativenumber = true,
   tabstop = 2,

   -- NvChad options
   nvChad = {
      copy_cut = true, -- copy cut text ( x key ), visual and normal mode
      copy_del = true, -- copy deleted text ( dd key ), visual and normal mode
      insert_nav = true, -- navigation in insertmode
      window_nav = true,
      terminal_numbers = false,

      -- updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}

M.ui = {
   theme = "onedark",
   transparency = false,
}
---- PLUGIN OPTIONS ----

-- Install plugins

local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
   install = userPlugins,
   status = {
      blankline = true, -- indentline stuff
      bufferline = true, -- manage and preview opened buffers
      colorizer = false, -- color RGB, HEX, CSS, NAME color codes
      comment = true, -- easily (un)comment code, language aware
      alpha = true, -- dashboard
      better_escape = true, -- map to <ESC> with no lag
      feline = true, -- statusline
      gitsigns = true,
      vim_matchup = true, -- improved matchit
      cmp = true,
      nvimtree = true,
      autopairs = true,
      lspsignature = true, -- lsp enhancements
   },
   options = {
      packer = {
         init_file = "plugins.packerInit",
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   default_plugin_config_replace = {
     dashboard = "custom.plugins.dashboard",
   },
   default_plugin_remove = {},
}
return M
