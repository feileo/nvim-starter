local default_config = require("nvchad.configs.treesitter")

local config = {
  ensure_installed = {
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "thrift",
    "json",
    "yaml",
    "sql",
    "regex",
    "bash",
    "python",
    -- "go"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "go" },
  },

  -- incremental_selection = { enable = false },

  -- textobjects = { enable = false },
}

return vim.tbl_deep_extend("force", default_config, config)
