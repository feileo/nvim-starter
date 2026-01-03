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
    "feileo/nvim-core",
    lazy = false,
    branch = "main",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require "options"
require "cmds"
require "autocmds"

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- 应用自定义高亮配置（Apply custom highlights）
vim.schedule(function()
  -- local ok, highlightsts = pcall(require, "highlightsts")
  -- if ok and highlightsts then
  --   if highlightsts.override then
  --     for hl_group, hl_opts in pairs(highlightsts.override) do
  --       vim.api.nvim_set_hl(0, hl_group, hl_opts)
  --     end
  --   end
  -- end

  -- local ok, highlightsrg = pcall(require, "highlights")
  -- if ok and highlightsrg then
  --   if highlightsrg.add then
  --     for hl_group, hl_opts in pairs(highlightsrg.add) do
  --       vim.api.nvim_set_hl(0, hl_group, hl_opts)
  --     end
  --   end
  -- end

  require "mappings"
end)
