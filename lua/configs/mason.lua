local default_config = require("nvchad.configs.mason")

local config = {}

return vim.tbl_deep_extend("force", default_config, config)
