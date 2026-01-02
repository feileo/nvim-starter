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

  -- disable default plugin which-key
  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      return require "configs.blankline"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "yamatsum/nvim-cursorline",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-cursorline").setup(require "configs.cursorline")
    end,
  },

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

  -- {
  --   "tpope/vim-sleuth",
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VimEnter",
  --   opts = function()
  --     return require "configs.lualine"
  --   end,
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },

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
    "nvim-treesitter/nvim-treesitter",
    -- event = "VimEnter",
    opts = function()
      return require "configs.treesitter"
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
    "leisiji/interestingwords.nvim",
    cmd = "Interestingwords",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
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

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    opts = function()
      return require "configs.telescope"
    end,
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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

  -- {
  --     "ray-x/go.nvim",
  --     dependencies = {  -- optional packages
  --       "ray-x/guihua.lua",
  --       "neovim/nvim-lspconfig",
  --       "nvim-treesitter/nvim-treesitter",
  --     },
  --     config = function()
  --         require("go").setup()
  --     end,
  --     event = {"CmdlineEnter"},
  --     ft = {"go", 'gomod'},
  --     build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  -- },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    opts = function()
      return require "configs.gopher"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
