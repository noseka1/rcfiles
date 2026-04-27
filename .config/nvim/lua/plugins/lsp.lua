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
    'saghen/blink.cmp',
    tag = "v1.10.2",
    pin = true,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- Similar to built-in, C-y to accept completion
        preset = 'default',
        -- Insert first item in completion list
        ['<C-n>'] = { 'show_and_insert', 'select_next', 'fallback' },
        ['<C-p>'] = { 'show_and_insert', 'select_prev', 'fallback' },
        ['<C-space>'] = { 'show_and_insert', 'select_next', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      -- Show completion documentation
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          },
        },
        documentation = {
          auto_show = true,
        },
        ghost_text = {
          -- Shows a preview of the currently selected item as virtual text inline
          enabled = true,
        },
        list = { selection = { preselect = true, auto_insert = true } },
        menu = {
          -- Don't automatically show the completion menu
          auto_show = false,
        },
      },
      -- Default list of enabled providers
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      -- Enable signature help (replacement for cmp-nvim-lsp-signature-help)
      signature = { enabled = true },
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
  },
  {
    "neovim/nvim-lspconfig",
    tag = 'v2.8.0',
    pin = true,
    dependencies = { "mason-org/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities(),
      vim.lsp.config('yamlls', {
        -- This tells the server that Neovim supports snippets and fancy completion items
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
            },
          },
        },
      })
      vim.lsp.config("lua_ls", {
        -- This tells the server that Neovim supports snippets and fancy completion items
        capabilities = capabilities,
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
