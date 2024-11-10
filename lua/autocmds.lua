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
}
)

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
    "python", "go", "thrift", "php", "c", "cpp", "java", "perl", "shell",
    "bash", "ruby", "apiblueprint",
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

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = {
--     "lua", "vim", "coffee", "html", "css", "xml", "jsx", "javascript", "fish",
--     "gitconfig", "less", "proto", "sql", "typescript", "typescript.tsx"
--   },
--   callback = function()
--     vim.opt.shiftwidth = 2
--     vim.opt.tabstop = 2
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = "yaml",
--   callback = function()
--     vim.opt.tabstop = 2
--     vim.opt.expandtab = true
--     vim.opt.shiftwidth = 2
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = "json",
--   callback = function()
--     vim.opt.smartindent = true
--     vim.opt.expandtab = true
--     vim.opt.formatoptions:append("tcq2l")
--     vim.opt.shiftwidth = 2
--     vim.opt.tabstop = 4
--   end,
-- })

create_autocmd("FileType", {
  group = user_ft_setter,
  pattern = "gitcommit",
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = "en_us,zh_cn"
  end,
})
-- highlight SpellBad ctermfg=red guifg=red
-- highlight SpellCap ctermfg=yellow guifg=yellow
-- highlight SpellLocal ctermfg=blue guifg=blue
-- highlight SpellRare ctermfg=magenta guifg=magenta

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = "makefile",
--   callback = function()
--     vim.opt.expandtab = false
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = "crontab",
--   callback = function()
--     vim.opt.backup = false
--     vim.opt.writebackup = false
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = "yaml.docker-compose",
--   callback = function()
--     vim.opt.expandtab = true
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = { "gitcommit", "qfreplace" },
--   callback = function()
--     vim.opt.foldenable = false
--   end,
-- })

-- autocmd("FileType", {
--   group = user_ft_setter,
--   pattern = { "html", "apache" },
--   callback = function()
--     vim.opt.path:append("./;/")
--   end,
-- })
