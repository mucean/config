local util = require 'lspconfig.util';
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "gopls", "rust_analyzer", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["clangd"].setup {
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["bufls"].setup {
  root_dir = util.root_pattern("buf.work.yaml", ".git", "buf.gen.yaml", "buf.yaml"),
}

-- 
-- lspconfig.pyright.setup { blabla}
