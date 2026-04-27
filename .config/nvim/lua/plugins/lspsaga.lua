return {
  {
    "nvimdev/lspsaga.nvim",
    commit = "562d9724e3869ffd1801c572dd149cc9f8d0cc36",
    pin = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    enabled = true,
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
        callhierarchy = {
          layout = "normal",
        },
        references = {
          layout = "normal",
        },
      })
    end,
    keys = {
      -- Key mappings
      {
        "<leader>sh",
        mode = { "n" },
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "Lspsaga hover_doc",
      },
      {
        "<leader>sf",
        mode = { "n" },
        "<cmd>Lspsaga finder<cr>",
        desc = "Lspsaga finder",
      },
      {
        "<leader>st",
        mode = { "n" },
        "<cmd>Lspsaga goto_type_definition<cr>",
        desc = "Lspsaga goto_type_definition",
      },
      {
        "<leader>sd",
        mode = { "n" },
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Lspsaga goto_definition",
      },
      {
        "<leader>sc",
        mode = { "n" },
        "<cmd>Lspsaga incoming_calls<cr>",
        desc = "Lspsaga incoming_calls",
      },
    },
  },
}
