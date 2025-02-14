-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local highlight = require "highlights"

---@type ChadrcConfig
local M = {
  base46 = {
    theme = "onedark",
    hl_override = highlight.override,
    hl_add = highlight.add,
    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
  },

  ui = {
    cmp = {
      style = "atom_colored",
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = "󱓻",
      },
    },
    statusline = {
      separator_style = "block",
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

  colorify = {
    enabled = false,
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
