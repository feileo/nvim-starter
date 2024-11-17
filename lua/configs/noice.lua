local config = {
  cmdline = {
    format = {
      search_down = { kind = "search", pattern = "^/", icon = "󰱽 | 󰑑 | ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "󰱽 | 󰑑 | ", lang = "regex" },
    },
  },
  messages = {
    enabled = false,
  },
  notify = {
    enabled = false,
  },
  lsp = {
    message = {
      enabled = false,
    },
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "lsp",
        kind = "progress",
        cond = function(message)
          local client = vim.tbl_get(message.opts, "progress", "client")
          return client == "lua_ls"
        end,
      },
      opts = { skip = true },
    },
  },
}

return config
