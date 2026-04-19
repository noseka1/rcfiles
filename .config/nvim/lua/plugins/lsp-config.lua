return {
  {
    "mason-org/mason.nvim",
    tag = "v2.2.1",
    pin = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    tag = "v2.1.0",
    pin = true,
    dependencies = "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls@v0.21.1",
          "lua_ls@3.18.2",
          "yamlls@1.22.0",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca",
    pin = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          autocomplete = false,
        },
        sources = {
          { name = "nvim_lsp" }, -- Enables LSP completion
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    tag = 'v2.8.0',
    pin = true,
    dependencies = { "mason-org/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config('yamlls', {
        -- This tells the server that Neovim supports snippets and fancy completion items
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
            },
          },
        },
      })
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    commit = "74b06c6c75e4eeb3108ec01852001636d85a932b",
    pin = true,
  },
  {
    "cwrau/yaml-schema-detect.nvim",
    commit = "82f5234c551b037e4383056706734ab5f59f1347",
    pin = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('yaml-schema-detect').setup()
    end,
    ft = { "yaml", "helm" },
  },
}
