local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff", bufnr).available then
        return { "ruff" }
      else
        return { "isort", "black", "autopep8" }
      end
    end,
    go = { "goimports", "gofmt" },
    rust = { "rustfmt", lsp_format = "fallback" },
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    -- These options will be passed to conform.format()
    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,
}

return options
