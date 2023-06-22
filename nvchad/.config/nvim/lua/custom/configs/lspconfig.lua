local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  html = {},
  cssls = {},
  tsserver = {},
  clangd = {},
  pyright = {},
  gopls = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
        unusedparams = true,
    },
  },
  rust_analyzer = {
    procMacro = {
      enable = true,
    },
  },
}

for lsp, settings in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
  }
end

