local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports-reviser" },
    -- go = { "gofumpt", "goimports" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    ["goimports-reviser"] = {
      --prepend_args = { "-rm-unused", "-set-alias" },
      prepend_args = { "-set-alias" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
