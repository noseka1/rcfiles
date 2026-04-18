return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1.17.0",
  pin = true,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 50,
      },
    })
  end,
}
