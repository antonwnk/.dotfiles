---@type MappingsTable
local M = {}

local ts_repeat = "nvim-treesitter.textobjects.repeatable_move"

-- Do some setup to be able to wrap default keybinds before they are overwritten
local rt_state
-- Grab initial keybindings only the first time this file is loaded
-- (i.e. before the "core.mappings" module gets merged with "custom.mappings")
if not package.loaded["custom.runtime_state"] then
  rt_state = require("custom.runtime_state")
  rt_state.gitsigns_original_next_hunk = require("core.mappings").gitsigns.n["]c"][1]
  rt_state.gitsigns_original_prev_hunk = require("core.mappings").gitsigns.n["[c"][1]
end

-- M.disabled = {
--   i = {
--     ["jk"] = "",
--   },
-- }

M.general = {

  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    -- [":"] = { ";", "Repeat motion" },
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

M.telescope = {

  n = {
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find symbol in document" },
    ["<leader>ws"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Find symbol in workspace" },
  }
}

M.git = {

  n = {
    -- safe to not wrap in a function because fugitive is not lazy (my working theory)
    ["<leader>gs"] = { vim.cmd.Git, "Show fugitive status menu" },
  }
}

M.gitsigns = {

  n = {
    ["]c"] = {
      function()
        local go_next_hunk, _ = require(ts_repeat).make_repeatable_move_pair(
          require("custom.runtime_state").gitsigns_original_next_hunk,
          require("custom.runtime_state").gitsigns_original_prev_hunk
        )
        go_next_hunk()
      end, "Go to next hunk (treesitter repeatable)" },
    ["[c"] = {
      function()
        local go_prev_hunk, _ = require(ts_repeat).make_repeatable_move_pair(
          require("custom.runtime_state").gitsigns_original_prev_hunk,
          require("custom.runtime_state").gitsigns_original_next_hunk
        )
        go_prev_hunk()
      end, "Go to prev hunk (treesitter repeatable)" },
    ["<leader>sh"] = {
      function ()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
  }
}

M.treesitter = {

  n = {
    [":"] = { function () require(ts_repeat).repeat_last_move_next() end, "Repeat move forwards (treesitter patched)" },
    [","] = { function () require(ts_repeat).repeat_last_move_previous() end, "Repeat move backwards (treesitter patched)" },
    ["f"] = { function () require(ts_repeat).builtin_f() end, "Go to first occurence in line (treesitter patched)" },
    ["F"] = { function () require(ts_repeat).builtin_F() end, "Go to previous occurence in line (treesitter patched)" },
    ["t"] = { function () require(ts_repeat).builtin_t() end, "Go till first occurence in line (treesitter patched)" },
    ["T"] = { function () require(ts_repeat).builtin_T() end, "Go till previous occurence in line (treesitter patched)" },
  },
  x = {
    [":"] = { function () require(ts_repeat).repeat_last_move_next() end, "Repeat move treesitter forwards (treesitter patched)" },
    [","] = { function () require(ts_repeat).repeat_last_move_previous() end, "Repeat move treesitter backwards (treesitter patched)" },
    ["f"] = { function () require(ts_repeat).builtin_f() end, "Go to first occurence in line (treesitter patched)" },
    ["F"] = { function () require(ts_repeat).builtin_F() end, "Go to previous occurence in line (treesitter patched)" },
    ["t"] = { function () require(ts_repeat).builtin_t() end, "Go till first occurence in line (treesitter patched)" },
    ["T"] = { function () require(ts_repeat).builtin_T() end, "Go till previous occurence in line (treesitter patched)" },
  },
  o = {
    [":"] = { function () require(ts_repeat).repeat_last_move_next() end, "Repeat move treesitter forwards (treesitter patched)" },
    [","] = { function () require(ts_repeat).repeat_last_move_previous() end, "Repeat move treesitter backwards (treesitter patched)" },
    ["f"] = { function () require(ts_repeat).builtin_f() end, "Go to first occurence in line (treesitter patched)" },
    ["F"] = { function () require(ts_repeat).builtin_F() end, "Go to previous occurence in line (treesitter patched)" },
    ["t"] = { function () require(ts_repeat).builtin_t() end, "Go till first occurence in line (treesitter patched)" },
    ["T"] = { function () require(ts_repeat).builtin_T() end, "Go till previous occurence in line (treesitter patched)" },
  },
}

return M

