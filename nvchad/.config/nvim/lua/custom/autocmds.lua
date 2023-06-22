local autocmd = vim.api.nvim_create_autocmd

-- Define groups first
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Trim trailing whitespace
autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Highlight text on yank (see `:help vim.highlight.on_yank()`)
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- -- Set tab options for Go files
-- autocmd('FileType', {
--   pattern = 'go',
--   callback = function ()
--     vim.opt_local.expandtab = false
--     vim.opt_local.tabstop = 4
--     vim.opt_local.softtabstop = 4
--     vim.opt_local.shiftwidth = 4
--   end
-- })

