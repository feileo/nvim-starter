-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

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

-- override default settings
nvlsp.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local map = vim.keymap.set

  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts "LSP hover doc")
  map("n", "<2-LeftMouse>", "<cmd>Lspsaga goto_definition<CR>", opts "LSP goto definition")
  map("n", "<A-LeftMouse>", "<cmd>Lspsaga goto_definition<CR>", opts "LSP goto definition")
  map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts "LSP goto definition")
  map("n", "gD", "<cmd>Lspsaga goto_type_definition<CR>", opts "LSP goto type definition")
  map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts "LSP peek definition")
  map("n", "gP", "<cmd>Lspsaga peek_type_definition<CR>", opts "LSP peek type definition")
  map("n", "gf", "<cmd>Lspsaga finder<CR>", opts "LSP finder")
  map("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts "LSP implementation")
  map("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts "LSP references")
  map("n", "gn", require "nvchad.lsp.renamer", opts "NvRenamer")
  -- map("n", "gn", "<cmd>Lspsaga rename<CR>", opts "LSP rename")
  map("n", "gN", "<cmd>Lspsaga rename ++project<CR>", opts "LSP rename project")

  map("n", "gca", "<cmd>Lspsaga code_action<CR>", opts "LSP code action")
  map("n", "gco", "<cmd>Lspsaga outgoing_calls<CR>", opts "LSP outgoing_calls")
  map("n", "gci", "<cmd>Lspsaga incoming_calls<CR>", opts "LSP incoming_calls")

  map("n", "<leader>d", "<cmd>Lspsaga goto_definition<CR>", opts "LSP goto definition")
  map("n", "<leader>D", "<cmd>Lspsaga goto_type_definition<CR>", opts "LSP goto type definition")
  map("n", "<leader>p", "<cmd>Lspsaga peek_definition<CR>", opts "LSP peek definition")
  map("n", "<leader>e", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts "LSP show buf diagnostics")
  map("n", "<leader>E", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts "LSP show work diagnostics")
  map("n", "<leader>0", "<cmd>Lspsaga outline<CR>", opts "LSP symbols outline")
end

-- lsps with config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
