vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.opt.whichwrap = "b,s"

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
  sh = 4,
}

api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.schedule(CodeRunner)
  end,
})

function CodeRunner()
  --local bufnr = vim.api.nvim_get_current_buf()
  --local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  local ft = vim.bo.filetype

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
