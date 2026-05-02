local M = {
  config = {
    cmdline = {
      format = {

        search_down = { kind = "search", pattern = "^/", icon = "󰱽 | 󰑑 | ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = "󰱽 | 󰑑 | ", lang = "regex" },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = "rounded", -- single, double, rounded, solid, shadow, none
          padding = { 0, 1 },
        },
      },
    },
    messages = {
      enabled = true,
    },
    notify = {
      enabled = true,
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
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
          },
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
  },

  -- 自定义配置（非插件配置）
  -- 高亮设置
  setup_highlights = function()
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#00d7ff" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = "#E69966" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { fg = "#E5C07B" })
  end,
}

return M
