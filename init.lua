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
vim.o.guifont = "JetBrainsMono_Nerd_Font_Mono:h10:b"

vim.cmd 'colorscheme nightfox'

vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true }) -- Select line(s) in visual mode and copy (CTRL+Shift+V)
vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true }) -- Paste in insert mode (CTRL+Shift+C)
vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true }) -- Paste in normal mode (CTRL+Shift+C)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

require("lspconfig")["basedpyright"].setup({
  settings = { 
    basedpyright =  {
      analysis = {
        diagnosticMode = 'workspace',
        autoSearchPaths=true,
        autoImportCompletions = true,
        typeCheckingMode = 'standard', 
        useLibraryCodeForTypes = true,
        reportUnusedVariable = 'warning',
        reportUnusedCallResult = false,
        reportUnusedFunction = 'warning',
        reportDuplicateImport = 'warning',
        reportGeneralTypeIssues = 'error',
        reportArgumentType = 'error',
        reportUnknownMemberType = 'error',
        reportAssignmentType = 'error',
        reportIncompatibleMethodOverride = true,
      },
    },
  },
})


