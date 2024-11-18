local default_config = require "nvchad.configs.nvimtree"

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- custom mappings
  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
  vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts "Open: Horizontal Split")
  -- vim.keymap.set("n", "d", api.fs.trash, opts "Trash")
  -- vim.keymap.set("n", "D", api.fs.remove, opts "Delete")
  -- vim.keymap.set("n", "K", api.node.show_info_popup, opts "Info")
end

local config = {
  on_attach = my_on_attach,
  sort_by = "case_sensitive",
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  -- view = {
  --   signcolumn = "no",
  -- },
  git = {
    enable = true,
    ignore = false,
  },
  filters = {
    dotfiles = false,
    custom = {
      "^\\.DS_Store",
      "__pycache__",
      "^\\.git$",
      "^\\.gitignore$",
      "^\\.hg",
      "^\\.svn",
      "^\\.rvm",
      "^\\.idea",
      "^\\.ropeproject",
      "^\\.cache",
      "^\\.swp",
      "^\\.a",
      "^\\.rbc$",
      "^\\.db$",
      "*.pyc",
      "*.pyo",
      "^\\.vscode",
      "^\\.settings",
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
    },
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return vim.tbl_deep_extend("force", default_config, config)
