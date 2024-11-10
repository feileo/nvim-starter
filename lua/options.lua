require "nvchad.options"

local o = vim.o
local g = vim.g

o.cindent = true
-- o.cursorlineopt = 'both' -- to enable cursorline!

o.smarttab = true

-- o.backup = false
-- o.wrap = false

o.ttyfast = true
o.startofline = true

o.signcolumn = "auto"
o.termguicolors = true

o.mouse = ""

g.go_highlight_comma = 1
g.go_highlight_semicolon = 1
g.go_highlight_fields = 1
g.go_highlight_struct_type_fields = 1
g.go_highlight_struct_fields = 1
g.go_highlight_variable_assignments = 0
g.go_highlight_variable_declarations = 0
g.go_highlight_short_variable_declarations = 0