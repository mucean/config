return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        --golang
        "go",
        "gomod",
        "gowork",
        --python
        "python",
        --rust
        "rust",
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "▏", highlight = "IblChar" },
      scope = { char = "▏", highlight = "IblScopeChar" },
    },
  },

  {
    "nvim-focus/focus.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("focus").setup {
        enable = true,
        autoresize = {
          enable = false,
        },
        ui = {
          cursorline = true,
          cursorcolumn = true,
          colorcolumn = { enable = true, list = "+1,+2" },
        },
      }
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require("illuminate").configure {
        providers = { "lsp", "treesitter" },
        min_count_to_highlight = 1,
        under_cursor = true,
      }
      -- https://ansidev.xyz/posts/2023-04-25-how-to-change-the-highlight-style-using-vim-illuminate
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "*" },
        callback = function()
          vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
          vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
        end,
      })
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          go = true,
          rust = true,
        },
      }
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    lazy = false,
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      local opts = require "nvchad.configs.cmp"
      table.insert(opts.sources, 1, { name = "copilot" })
      return opts
    end,
  },
  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local opts = require "nvchad.configs.gitsigns"
      opts.current_line_blame = true
      return opts
    end,
  },
}
