-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local highlights = require "highlights"

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "onedark",
    hl_override = highlights.override,
    hl_add = highlights.add,
  },

  ui = {
    cmp = {
      style = "atom_colored",
    },

    tabufline = {
      enabled = true,
    },

    statusline = {
      -- enabled = false, -- 禁用 NvChad 状态栏，使用 lualine
      theme = "minimal",
      separator_style = "round",
    },
  },

  term = {
    sizes = { sp = 0.4, vsp = 0.35, ["bo sp"] = 0.4, ["bo vsp"] = 0.35 },
    float = {
      row = 0.1,
      col = 0.15,
      width = 0.7,
      height = 0.8,
    },
  },

  lsp = { signature = false },

  colorify = {
    enabled = false,
  },
}

return M
