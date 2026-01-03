require "nvchad.options"

local o = vim.o
local g = vim.g

o.cindent = true
o.cursorlineopt = "both" -- to enable cursorline!

o.breakindent = true
o.smarttab = true

o.backup = false
o.wrap = false

o.ttyfast = true
o.startofline = true

o.signcolumn = "auto"
o.termguicolors = true

o.mouse = "a"

if vim.g.neovide then
    vim.o.guifont = "Maple Mono NF CN:h14"       -- 字体配置
    vim.g.neovide_line_space = 2                 -- 行间距
    vim.g.neovide_scale_factor = 1.0             -- 缩放
    vim.g.neovide_scroll_animation_length = 0.3  -- 平滑滚动
    vim.g.neovide_refresh_rate = 60              -- 刷新率
    vim.g.neovide_transparency = 0.95            -- 透明度
    vim.g.neovide_cursor_animation_length = 0.13 -- 光标动画
    vim.g.neovide_cursor_trail_size = 0.8
end

g.go_highlight_comma = 1
g.go_highlight_semicolon = 1
g.go_highlight_fields = 1
g.go_highlight_struct_type_fields = 1
g.go_highlight_struct_fields = 1
g.go_highlight_variable_assignments = 0
g.go_highlight_variable_declarations = 0
g.go_highlight_short_variable_declarations = 0
