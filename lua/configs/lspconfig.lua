-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  lua_ls = {},
  html = {},
  cssls = {},
  bashls = {},
  clangd = {},
  gopls = {
    filetypes = { "go", "gomod" },
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
      },
    },
    init_options = {
      usePlaceholders = false,
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- lsps with config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)
