-- ============================================================================
-- Lualine 配置 - 简洁美观版
-- ============================================================================

local config = {
  options = {
    theme = 'wombat', -- wombat 主题
    component_separators = { left = '│', right = '│' },
    section_separators = { left = '', right = '' },
    globalstatus = true, -- 全局状态栏
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    disabled_filetypes = {
      statusline = { 'dashboard', 'alpha', 'starter' },
      winbar = {},
    },
  },

  sections = {
    -- 左侧：模式
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1) -- 只显示首字母
        end,
      },
    },

    -- 左侧：Git 信息
    lualine_b = {
      {
        'branch',
        icon = '',
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },

    -- 中间：文件信息
    lualine_c = {
      {
        'filename',
        path = 1, -- 相对路径
        symbols = {
          modified = ' ',
          readonly = ' ',
          unnamed = '[No Name]',
          newfile = ' ',
        },
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    },

    -- 右侧：LSP 和工具状态
    lualine_x = {
      {
        -- Supermaven AI 状态
        function()
          local ok, api = pcall(require, "supermaven-nvim.api")
          if ok and api.is_running() then
            return ''
          end
          return ''
        end,
        color = { fg = '#98c379' },
      },
      {
        -- LSP 服务器
        function()
          local clients = vim.lsp.get_clients { bufnr = 0 }
          if #clients == 0 then
            return ''
          end
          local names = {}
          for _, client in ipairs(clients) do
            if client.name ~= 'null-ls' and client.name ~= 'copilot' then
              table.insert(names, client.name)
            end
          end
          if #names == 0 then
            return ''
          end
          return '󰒋 ' .. names[1] -- 只显示第一个
        end,
        cond = function()
          return vim.fn.winwidth(0) > 80
        end,
      },
      {
        'searchcount',
        maxcount = 999,
        timeout = 500,
      },
    },

    -- 右侧：文件类型和位置
    lualine_y = {
      {
        'filetype',
        icon_only = false,
        colored = true,
      },
      {
        'encoding',
        cond = function()
          return vim.fn.winwidth(0) > 100
        end,
      },
    },

    -- 右侧：位置信息
    lualine_z = {
      { 'progress' },
      { 'location' },
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},

  extensions = {
    'nvim-tree',
    'lazy',
    'mason',
    'telescope',
    {
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      filetypes = { 'dashboard' },
    },
  },
}

return config
