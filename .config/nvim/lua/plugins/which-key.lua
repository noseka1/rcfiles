return {
  {
    "folke/which-key.nvim",
    tag = "v3.17.0",
    pin = true,
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    }
  }
}
