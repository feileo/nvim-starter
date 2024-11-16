return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
    event = "VimEnter",
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
    event = "VimEnter",
  },

  "nvzone/volt",
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },

  {
    "folke/which-key.nvim",
    enabled = false, -- disable default plugin
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      return require "configs.blankline"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require "configs.conform"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    -- ft = { "gitcommit", "diff" },
    opts = function()
      return require "configs.gitsigns"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = function()
      return require "configs.lspsaga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "configs.telescope"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- event = "VimEnter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {},
  },

  -- {
  --   "yamatsum/nvim-cursorline",
  --   init = function()
  --     require("nvim-cursorline").setup(require "configs.cursorline")
  --   end,
  -- },

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      return require "configs.dashboard"
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "leisiji/interestingwords.nvim",
    cmd = "Interestingwords",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    opt = function()
      return require "configs.gopher"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "voldikss/vim-translator",
    event = "VimEnter",
    cmd = { "TranslateW", "TranslateWV" },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- {
  --   "VonHeikemen/fine-cmdline.nvim",
  --   -- event = "VimEnter",
  --   keys = { "'", "\"" },
  --   dependencies = {
  --     { "MunifTanjim/nui.nvim" },
  --   },
  -- },
}
