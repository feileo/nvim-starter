local opts = {
  symbol_in_winbar = {
    enable = false,
  },
  callhierarchy = {
    keys = {
      edit = { "o", "CR" },
      vsplit = "<C-v>",
      split = "<C-s>",
      quit = { "q", "<ESC>", "<C-c>" },
    },
  },
  code_action = {
    show_server_name = true,
    quit = { "q", "<ESC>", "<C-c>" },
  },
  definition = {
    width = 0.8,
    height = 0.9,
    keys = {
      edit = { "o", "CR" },
      vsplit = "<C-v>",
      split = "<C-s>",
      quit = { "q", "<ESC>", "<C-c>" },
    },
  },
  finder = {
    keys = {
      edit = { "o", "CR" },
      vsplit = "<C-v>",
      split = "<C-s>",
      quit = { "q", "<ESC>", "<C-c>" },
    },
  },
  outline = {
    auto_preview = false,
    detail = false,
    keys = {
      jump = "<CR>",
      quit = { "q", "<ESC>", "<C-c>" },
    },
  },
  rename = {
    auto_save = false,
    keys = {
      select = "x",
      quit = { "q", "<ESC>", "<C-c>" },
    },
  },
  diagnostic = {
    keys = {
      exec_action = { "CR" },
      quit = { "q", "<ESC>" },
      quit_in_show = { "q", "<ESC>", "<C-c>" },
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
