local util = require("util")
local create_command = vim.api.nvim_create_user_command

create_command(
  "Format",
  util.do_format,
  { range = true }
)

create_command(
  "FormatDisable",
  util.disable_autoformat,
  { desc = "Disable autoformat-on-save", bang = true, }
)

create_command(
  "FormatEnable",
  util.enable_autoformat,
  { desc = "Re-enable autoformat-on-save" }
)

create_command(
  "ExitSafe",
  util.exit_safe,
  { desc = "Safe exit" }
)

create_command(
  'MouseToggle',
  util.toggle_mouse,
  { desc = "Toggle mouse" }
)

create_command(
  "PeekDefinitionToggle",
  util.toggle_peek_definition,
  { desc = "Toggle lspsaga peek definition" }
)

