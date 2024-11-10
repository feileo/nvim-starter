local opts = {
  symbol_in_winbar = {
    enable = false,
  },
  callhierarchy = {
    keys = {
      edit = { "o", "CR" },
      vsplit = "v",
      split = "s",
      quit = { "q", '<ESC>' }
    },
  },
  code_action = {
    show_server_name = true,
    quit = { "q", '<ESC>' }
  },
  definition = {
    width = 0.6,
    height = 0.8,
    keys = {
      edit = { "o", "CR" },
      vsplit = "v",
      split = "s",
      quit = { "q", '<ESC>' }
    },
  },
  finder = {
    keys = {
      edit = { "o", "CR" },
      vsplit = "v",
      split = "s",
      quit = { "q", '<ESC>' }
    },
  },
  outline = {
    auto_preview = false,
    detail = false,
    keys = {
      jump = "<CR>",
      quit = { "q", '<ESC>' }
    },
  },
  rename = {
    auto_save = false,
    keys = {
      select = "x",
      quit = { "q", '<ESC>' }
    },
  },
  diagnostic = {
    keys = {
      exec_action = { "CR" },
      quit = { "q", '<ESC>' },
      quit_in_show = { 'q', '<ESC>' }
    },
  },
  lightbulb = {
    sign = false,
    debounce = 2000,
  },
  ui = {
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
  },
}

return opts
