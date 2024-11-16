local config = {
  cmdline = {
    view = "cmdline_popup",
    format = {
      search_down = { kind = "search", pattern = "^/", icon = "󰱽 | 󰑑 | ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "󰱽 | 󰑑 | ", lang = "regex" },
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = false, -- enables the Noice messages UI
    view = "", -- default view for messages
    view_warn = "", -- view for warnings
    view_error = "notify", -- view for errors
    -- view_history = "messages", -- view for :messages
    -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true,
  },
  redirect = {
    view = "popup",
    filter = { event = "msg_show" },
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
