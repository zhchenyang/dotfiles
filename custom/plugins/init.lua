return {
  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
     opt = true,
     config = function()
        require("neoscroll").setup({
          mappings = {
            '<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb',
          },
        })
     end,

     -- lazy loading
     setup = function()
       require("core.utils").packer_lazy_load "neoscroll.nvim"
     end,
  },
  {
    "lilydjwg/fcitx.vim",
    keys = {'i', 'a', 'I', 'A', 'c', 'o', 'O'},
  },
  -- {
  --   "github/copilot.vim"
  -- },
  {
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    config = function()
       require("telescope").setup {
          extensions = {
             media_files = {
                filetypes = { "png", "webp", "jpg", "jpeg" },
             },
             -- fd is needed
          },
       }
       require("telescope").load_extension "media_files"
    end,
  },
  {
    "sillybun/vim-repl"
  }
}
