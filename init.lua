-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end


require "lazy_setup"
require "polish"


vim.o.wrap = true

vim.g.neovide_scale_factor = 0.72

vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true }) -- Select line(s) in visual mode and copy (CTRL+Shift+V)
vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true }) -- Paste in insert mode (CTRL+Shift+C)
vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true }) -- Paste in normal mode (CTRL+Shift+C)

--  Optional, you don't have to run setup.
-- require("transparent").setup({
--   -- table: default groups
--   groups = {
--     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--     'EndOfBuffer',
--   },
--   -- table: additional groups that should be cleared
--   extra_groups = {},
--   -- table: groups you don't want to clear
--   exclude_groups = {},
--   -- function: code to be executed after highlight groups are cleared
--   -- Also the user event "TransparentClear" will be triggered
--   on_clear = function() end,
-- })


require("lspconfig")["basedpyright"].setup({
  settings = { 
    basedpyright =  {
      analysis = {
        diagnosticMode = 'workspace',
        autoSearchPaths=true,
        autoImportCompletions = true,
        typeCheckingMode = 'basic', 
        useLibraryCodeForTypes = true,
        reportUnusedVariable = 'warning',
        reportUnusedCallResult = false,
        reportUnusedFunction = 'warning',
        reportDuplicateImport = 'warning',
        reportGeneralTypeIssues = 'error',
        reportArgumentType = 'error',
        reportUnknownMemberType = 'error',
        reportAssignmentType = 'error',
      },
    },
  },
})


vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>lg', '<Cmd>RunCode<CR>', { noremap = true, silent = true })


vim.cmd[[colorscheme tokyonight]]