local default_config = require("nvchad.configs.gitsigns")

local config = {
  current_line_blame = true,
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local map = vim.keymap.set

    map('n', '<leader>hp', gitsigns.preview_hunk)
    -- map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
    -- map('n', '<leader>hd', gitsigns.diffthis)
    -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
  end
}

return vim.tbl_deep_extend("force", default_config, config)
