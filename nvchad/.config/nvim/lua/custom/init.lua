
local custom_opts = vim.api.nvim_get_runtime_file("lua/custom/options.lua", false)[1]
local custom_aucmds = vim.api.nvim_get_runtime_file("lua/custom/autocmds.lua", false)[1]

if custom_opts then
  dofile(custom_opts)
end
if custom_aucmds then
  dofile(custom_aucmds)
end

