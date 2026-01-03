local default_config = require "nvchad.configs.treesitter"

local config = {
  ensure_installed = {
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
    "thrift",
    "json",
    "yaml",
    "toml",
    "properties",
    "sql",
    "regex",
    "bash",
    "python",
    "go",
    "rust",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    -- 启用 Go 的 Tree-sitter 高亮以支持现代化方案
    disable = { "go" },

    -- 启用 vim 语法作为 Tree-sitter 的补充
    -- 只对 Go 启用，因为 syntax/go.vim 提供了格式化占位符等额外高亮
    -- additional_vim_regex_highlighting = true,
    -- additional_vim_regex_highlighting = { "go" },
  },

  -- incremental_selection = { enable = false },

  -- textobjects = { enable = false },
  playground = {
    enable = true,
    -- 可以在这里配置一些 playground 选项
  }
}

return vim.tbl_deep_extend("force", default_config, config)
