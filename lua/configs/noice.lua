local config = {
  cmdline = {
    format = {
      search_down = { kind = "search", pattern = "^/", icon = "󰱽 | 󰑑 | ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "󰱽 | 󰑑 | ", lang = "regex" },
    },
  },
  messages = {
    enabled = false,
    view = false,
    view_warn = false,
    -- view_warn = "notify",
  },
  popupmenu = {
    enabled = true,
  },
  notify = {
    enabled = false,
  },

  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    message = {
      enabled = false,
    },
  },
  smart_move = {
    enabled = false,
  },
}

return config
