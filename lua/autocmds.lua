require "nvchad.autocmds"

local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
--       vim.cmd "quit"
--     end
--   end,
-- })

local user_ft_setter = vim.api.nvim_create_augroup("user_ft_setter", { clear = true })

create_autocmd("FileType", {
  group = user_ft_setter,
  pattern = "go",
  callback = function()
    vim.opt.foldmethod = "manual"
  end,
})

create_autocmd("FileType", {
  group = user_ft_setter,
  pattern = {
    "python",
    "go",
    "thrift",
    "php",
    "c",
    "cpp",
    "java",
    "perl",
    "shell",
    "bash",
    "ruby",
    "apiblueprint",
  },
  callback = function()
    vim.opt.cindent = true
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    -- vim.opt.cursorcolumn = false
    -- vim.opt.synmaxcol = 8000
    -- vim.opt.re = 1
  end,
})

create_autocmd("FileType", {
  group = user_ft_setter,
  pattern = "gitcommit",
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en_us,zh_cn"
  end,
})
