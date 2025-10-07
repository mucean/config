-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- local servers = { "html", "cssls", "golangci_lint_ls", "buf_ls", "bashls" }
local servers = { "html", "cssls", "buf_ls", "bashls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- golang
-- all settings in https://github.com/golang/tools/blob/master/gopls/doc/settings.md
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      usePlaceholders = true,
      -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
      analyses = {
        unusedparams = true,
      },
      -- https://staticcheck.dev/docs/getting-started
      staticcheck = true,
      -- https://github.com/mvdan/gofumpt
      -- gofumpt = true,
    },
  },
}
