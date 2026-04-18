return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1.17.0",
  pin = true,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local function on_attach(bufnr)
      local api = require('nvim-tree.api')
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr,
          noremap = true, silent = true, nowait = true }
      end
      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)
      -- Custom mapping
      vim.keymap.set('n', '<CR>',
        function(node)
          local api = require("nvim-tree.api")
          api.node.open.edit(node)
          api.tree.focus()
        end,
        opts('Open and Keep Focus'))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = {
        width = 50,
      },
      -- Change the tree's root directory when changing the current
      -- working directory
      sync_root_with_cwd = true,
      -- Highlight the file currently opened
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
  end,
}
