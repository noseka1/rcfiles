-- Disable terminal GUI colors
vim.opt.termguicolors = false

-- Disable netrw in favor of nvim-tree and yazi
-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Force-enable the optimized loader for v0.12
if vim.loader then vim.loader.enable() end

local vim_dir = vim.fn.expand("~/.vim")
local minpac_start = vim_dir .. "/pack/minpac/start"

-- Manually inject every plugin folder into the Runtime Path
-- This bypasses the need for 'packpath' to behave correctly
local plugins = vim.fn.glob(minpac_start .. "/*", true, true)
for _, path in ipairs(plugins) do
    if vim.fn.isdirectory(path) == 1 then
        vim.opt.runtimepath:append(path)

        -- If the plugin has a 'lua' subdirectory, make it require-able
        local lua_path = path .. "/lua"
        if vim.fn.isdirectory(lua_path) == 1 then
            package.path = package.path .. ";" .. lua_path .. "/?.lua"
        end
    end
end

-- Expand the path to ensure it's absolute
local vimrc = vim.fn.expand("~/.vimrc")

-- Check if the file exists before sourcing to avoid errors on new systems
if vim.fn.filereadable(vimrc) == 1 then
    vim.cmd("source " .. vimrc)
end

-- Revert back to vim behavior of Y
-- See  https://www.reddit.com/r/neovim/comments/petq61/neovim_060_y_not_yanking_line_but_to_end_of_line/
vim.cmd("nnoremap Y Y")

-- Install lazy.nvim package manager
require("config.lazy")
