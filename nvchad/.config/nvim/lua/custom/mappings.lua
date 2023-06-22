---@type MappingsTable
local M = {}

-- M.disabled = {
--   i = {
--     ["jk"] = "",
--   },
-- }

M.general = {

  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    -- Git stuff
    ["<leader>gs"] = { vim.cmd.Git, "Show fugitive status menu" },
    ["<leader>sh"] = {
      function ()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    -- Navigation
    ["n"] = { "nzzzv", "Keep search result centered (next)" },
    ["N"] = { "Nzzzv", "Keep search result centered (prev)" },
    ["<leader>j"] = { "<cmd>lnext<CR>zz", "Loclist move up" },
    ["<leader>k"] = { "<cmd>lprev<CR>zz", "Loclist move down" },
    ["<leader>J"] = { "<cmd>cnext<CR>zz", "Quickfix list move up" },
    ["<leader>K"] = { "<cmd>cprev<CR>zz", "Quickfix list move down" },
    -- Editing
    ["J"] = { "mzJ`z", "Keep cursor in place at line join" },
    ["<leader>d"] = { '"_d', "Delete without overwrite" },
    ["<leader>D"] = { '"_D', "Delete to endl without overwrite" },
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
    ["<leader>Y"] = { '"+Y', "Yank to endl to system clipboard" },
  },

  x = {
    ["<leader>p"] = { '"_dP', "Paste without overwrite" },
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected up" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected down" },
    ["<leader>d"] = { '"_d', "Delete without overwrite" },
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
  },

}

-- more keybinds!
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

return M

