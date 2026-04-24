-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

-- local servers = { "html", "cssls", "golangci_lint_ls", "buf_ls", "bashls" }
local servers = { "html", "cssls", "buf_ls", "bashls", "gopls"}

-- golang
-- all settings in https://github.com/golang/tools/blob/master/gopls/doc/settings.md
vim.lsp.config("gopls", {
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
})
vim.lsp.enable(servers)
