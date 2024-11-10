local options = {
  indent = {
    char = "│",
    highlight = "IblChar"
  },
  scope = {
    show_start = false,
    show_end = false,
    char = "│",
    highlight = "IblScopeChar"
  },
  exclude = {
    filetypes = {
      "packer",
      "help",
      "terminal",
      "lazy",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "nvdash",
      "nvcheatsheet",
      "translator",
      "NvimTree",
      "dashboard",
      "checkhealth",
      "man",
      "gitcommit",
      "",
    },
  }
}

return options
