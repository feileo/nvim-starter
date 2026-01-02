local M = {}

local exit_confirm = function()
  local buf = vim.api.nvim_create_buf(false, true)

  local opts_confirm = {
    style = "minimal",
    relative = "editor",
    width = 52,
    height = 4,
    col = vim.o.columns / 2 - 27,
    row = vim.o.lines / 2 - 3,
    border = "rounded",
  }
  local win = vim.api.nvim_open_win(buf, true, opts_confirm)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    " Unsaved! Do you want to save all changes and exit? ",
    " ",
    " ",
  })

  vim.api.nvim_command "highlight Yes guibg=#A1C180 guifg=#000033"
  vim.api.nvim_command "highlight No guibg=#D78787 guifg=#000033"
  vim.api.nvim_command "highlight Cancel guibg=#999999 guifg=#000033"

  local ns_id = vim.api.nvim_create_namespace "exit_confirm"
  vim.api.nvim_buf_set_extmark(
    buf,
    ns_id,
    2,
    0,
    { virt_text = { { "     Y(es)     ", "Yes" } }, hl_mode = "combine", hl_group = "Yes" }
  )
  vim.api.nvim_buf_set_extmark(
    buf,
    ns_id,
    2,
    1,
    { virt_text = { { "      N(o)     ", "No" } }, hl_mode = "combine", hl_group = "No" }
  )
  vim.api.nvim_buf_set_extmark(
    buf,
    ns_id,
    2,
    1,
    { virt_text = { { "    C(ancel)    ", "Cancel" } }, hl_mode = "combine", hl_group = "Cancel" }
  )

  vim.api.nvim_buf_set_keymap(buf, "n", "y", "<cmd>wqa<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "n", "<cmd>qa!<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "c",
    "<cmd>lua vim.api.nvim_win_close(" .. win .. ", true)<CR>",
    { noremap = true, silent = true }
  )

  local function close_win()
    vim.api.nvim_win_close(win, true)
  end

  vim.api.nvim_create_autocmd("WinClosed", {
    group = vim.api.nvim_create_augroup("CloseConfirmWin", { clear = true }),
    pattern = "*",
    callback = close_win,
  })
end

M.exit_safe = function()
  local unsaved_buffers = false
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified then
      unsaved_buffers = true
      break
    end
  end

  if unsaved_buffers then
    exit_confirm()
  else
    vim.cmd "qa"
  end
end

M.do_format = function(args)
  local range = nil

  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end

  require("conform").format {
    async = true,
    lsp_format = "fallback",
    range = range,
  }
  vim.cmd "update"
end

M.disable_autoformat = function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end

M.enable_autoformat = function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end

M.toggle_mouse = function()
  local mouse_enabled = vim.o.mouse
  if mouse_enabled == "" then
    vim.o.mouse = "a"
  else
    vim.o.mouse = ""
  end
end

local lspsaga_peek_win_id = nil

M.toggle_peek_definition = function()
  if lspsaga_peek_win_id then
    lspsaga_peek_win_id = nil
    vim.cmd "q"
  else
    lspsaga_peek_win_id = "defined"
    vim.cmd "Lspsaga peek_definition"
  end
end

M.close_window = function()
  -- 获取当前窗口列表
  local windows = vim.api.nvim_list_wins()
  local win_count = #windows
  local current_win = vim.api.nvim_get_current_win()

  -- 如果窗口数量等于 2
  if win_count == 2 then
    local nvim_tree_open = false

    -- 遍历所有窗口，检查缓冲区名称
    for _, win in ipairs(windows) do
      local buf = vim.api.nvim_win_get_buf(win)
      local buf_name = vim.api.nvim_buf_get_name(buf)

      -- 检查缓冲区名称是否包含 "NvimTree_" 且不是当前窗口
      if buf_name:match "NvimTree_" and win ~= current_win then
        nvim_tree_open = true
        break
      end
    end

    -- 如果有一个窗口的缓冲区名称包含 "NvimTree_" 且不是当前窗口，则不执行任何操作
    if nvim_tree_open then
      return
    end
  end

  -- 关闭当前窗口
  vim.cmd "wincmd c" -- 或者使用更简洁的 '<C-w>c'
end

return M
