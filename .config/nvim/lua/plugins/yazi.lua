return {
  {
    "mikavilpas/yazi.nvim",
    tag = "v13.1.5",
    pin = true,
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- Key mappings
      {
        "<leader>yo",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<leader>yc",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<leader>yt",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- Open yazi instead of netrw
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
  }
}
