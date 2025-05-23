-- --- @param trunc_width number trunctates component when screen width is less then trunc_width
-- --- @param trunc_len number truncates component to trunc_len number of chars
-- --- @param hide_width number hides component when window width is smaller then hide_width
-- --- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
-- --- return function that can format the component accordingly
-- local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
--   return function(str)
--     local win_width = vim.fn.winwidth(0)
--     if hide_width and win_width < hide_width then
--       return ""
--     elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
--       return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
--     end
--     return str
--   end
-- end
--
-- local function window()
--   return vim.api.nvim_win_get_number(0)
-- end
--
-- -- local function diff_source()
-- --   local gitsigns = vim.b.gitsigns_status_dict
-- --   if gitsigns then
-- --     return {
-- --       added = gitsigns.added,
-- --       modified = gitsigns.changed,
-- --       removed = gitsigns.removed,
-- --     }
-- --   end
-- -- end
--
-- local custom_fname = require("lualine.components.filename"):extend()
-- local highlight = require "lualine.highlight"
-- local default_status_colors = { saved = "#228B22", modified = "#C70039" }
--
-- function custom_fname:init(options)
--   custom_fname.super.init(self, options)
--   self.status_colors = {
--     saved = highlight.create_component_highlight_group(
--       { bg = default_status_colors.saved },
--       "filename_status_saved",
--       self.options
--     ),
--     modified = highlight.create_component_highlight_group(
--       { bg = default_status_colors.modified },
--       "filename_status_modified",
--       self.options
--     ),
--   }
--   if self.options.color == nil then
--     self.options.color = ""
--   end
-- end
--
-- function custom_fname:update_status()
--   local data = custom_fname.super.update_status(self)
--   data = highlight.component_format_highlight(
--     vim.bo.modified and self.status_colors.modified or self.status_colors.saved
--   ) .. data
--   return data
-- end
--
-- local config = {
--   options = {
--     theme = "onedark",
--     -- component_separators = { left = '', right = ''},
--     -- section_separators = { left = '', right = ''},
--     -- section_separators = { left = "", right = "" },
--     -- component_separators = { left = "", right = "" },
--     component_separators = "|",
--     section_separators = "",
--   },
--   sections = {
--     lualine_a = {
--       {
--         "mode",
--         icons_enabled = true,
--         fmt = trunc(80, 4, 0, true),
--       },
--       -- {
--       --   "buffers",
--       --   show_filename_only = true, -- Shows shortened relative path when set to false.
--       --   hide_filename_extension = false, -- Hide filename extension when set to true.
--       --   show_modified_status = true, -- Shows indicator when the buffer is modified.
--       -- },
--       -- {
--       --   function()
--       --     return require("lsp-status").status()
--       --   end,
--       --   fmt = trunc(120, 20, 60),
--       -- },
--     },
--     lualine_b = {
--       { "branch" },
--       -- { "b:gitsigns_head", icon = "" },
--       {
--         "diff",
--         -- source = diff_source,
--       },
--       { "diagnostics" },
--     },
--     lualine_c = {
--       -- {
--       --   "filename",
--       --   fmt = trunc(90, 30, 50, false),
--       -- },
--       { custom_fname },
--     },
--     lualine_x = {
--       { "encoding" },
--       { "fileformat" },
--       { "filetype" },
--     },
--     lualine_y = {
--       {
--         "progress",
--       },
--       {
--         function()
--           local space = vim.fn.search([[\s\+$]], "nwc")
--           return space ~= 0 and "TW:" .. space or ""
--         end,
--       },
--       {
--         function()
--           local space_pat = [[\v^ +]]
--           local tab_pat = [[\v^\t+]]
--           local space_indent = vim.fn.search(space_pat, "nwc")
--           local tab_indent = vim.fn.search(tab_pat, "nwc")
--           local mixed = (space_indent > 0 and tab_indent > 0)
--           local mixed_same_line
--           if not mixed then
--             mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
--             mixed = mixed_same_line > 0
--           end
--           if not mixed then
--             return ""
--           end
--           if mixed_same_line ~= nil and mixed_same_line > 0 then
--             return "MI:" .. mixed_same_line
--           end
--           local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
--           local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
--           if space_indent_cnt > tab_indent_cnt then
--             return "MI:" .. tab_indent
--           else
--             return "MI:" .. space_indent
--           end
--         end,
--       },
--     },
--     lualine_z = {
--       {
--         window,
--       },
--       {
--         "location",
--       },
--     },
--   },
-- }
--
-- return config


-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local lua_config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(lua_config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(lua_config.sections.lualine_x, component)
end

ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ""
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
}

ins_left { "location" }

ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return "%="
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
}

-- Add components to right sections
ins_right {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}

ins_right {
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

return lua_config
