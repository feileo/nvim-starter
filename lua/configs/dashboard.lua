local config = {
  theme = "hyper",
  shortcut_type = "number", -- 'letter' or 'number'
  change_to_vcs_root = false,
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = "󰊳 Update", group = "@keyword", action = "Lazy update", key = "U" },
      { desc = " Files", group = "@property", action = "Telescope find_files", key = "F" },
      { desc = "󰘳 Keys", group = "@type", action = "Telescope keymaps", key = "K" },
      { desc = "󰾙 Help", group = "@string", action = "Telescope help_tags", key = "H" },
      { desc = " Quit", group = "@constructor", action = "qa!", key = "Q" },
    },
    packages = { enable = true }, -- show how many plugins neovim loaded
    project = { icon = " " },
    -- mru = { },
    footer = { "", "", "🚀", "", "  Sharp tools make good work !" },
  },
}

return config
