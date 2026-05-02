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
    layout = 'float',
    auto_preview = false,
    win_width = 40,
    detail = false,
    keys = {
      jump = "<CR>",
      quit = { "q", "<ESC>", "<C-c>" },
    },
    max_height = 0.7,
    left_width = 0.2,
  },
  rename = {
    auto_save = false,
    in_select = false,
    keys = {
      select = "x",
      quit = { "q", "<ESC>" },
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
