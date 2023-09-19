-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local api = vim.api

local function settab(num)
  vim.opt_local.tabstop = num
  vim.opt_local.shiftwidth = num
  vim.opt_local.softtabstop = num
  vim.opt_local.smarttab = true
  vim.opt_local.smartindent = true
  vim.opt_local.expandtab = true
end

local tabspaces = {
  yaml = 2,
}

api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.schedule(CodeRunner)
  end,
})

function CodeRunner()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

  if ft == "go" then
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  else
    local space = tabspaces[ft]
    if space ~= nil then
      settab(space)
    end
  end
end
