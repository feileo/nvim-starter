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
      theme = "minimal",
      separator_style = "round",
    },
  },

  term = {
    sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.3 },
    float = {
      row = 0.15,
      col = 0.15,
      width = 0.7,
      height = 0.6,
    },
  },

  lsp = { signature = false },

  colorify = {
    enabled = false,
  },
}

return M
