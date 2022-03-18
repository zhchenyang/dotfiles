return {
  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
     opt = true,
     config = function()
        require("neoscroll").setup()
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
  }
}
