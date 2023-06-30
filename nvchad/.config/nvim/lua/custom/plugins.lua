local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      { "folke/neodev.nvim", ft = "lua" },
      { "j-hui/fidget.nvim", tag = "legacy" },
      { "simrat39/symbols-outline.nvim", config = true },
      {
        "stevearc/aerial.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
      }
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context" },
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = overrides.treesitter_context,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = overrides.better_escape,
  },

  -- Git plugins
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },

  -- "tpope/vim-sleuth",
  { "tpope/vim-surround", event = "InsertEnter" },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
