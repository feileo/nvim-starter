require "nvchad.mappings"

local nomap = vim.keymap.del

nomap("n", "<C-n>")
nomap("i", "<C-e>")
nomap("n", "<C-c>")
nomap("t", "<C-x>")
nomap("n", "<A-i>")
nomap("t", "<A-i>")
nomap("n", "<leader>b")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>/")
nomap("v", "<leader>/")
nomap("n", "<leader>e")
nomap("n", "<leader>n")
nomap("n", "<leader>wK")
nomap("n", "<leader>wk")
nomap("n", "<leader>rn")
nomap("n", "<leader>fm")
nomap("n", "<leader>ma")
nomap("n", "<leader>fz")
nomap("n", "<leader>cm")
nomap("n", "<leader>ds")
nomap("n", "<leader>gt")
nomap("n", "<leader>ch")
nomap("n", "<leader>pt")
nomap("n", "<leader>th")


local map = vim.keymap.set

map({ "n" }, "<C-]>", "z4l", { desc = "move right 4 line" })
map({ "n" }, "<C-[>", "z4h", { desc = "move left 4 line" })
map({ "n", "i" }, "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map({ "n", "i" }, "<C-n>", "<End>", { desc = "move end of line" })
map({ "v" }, "<C-k>", ":move-2<CR>gv", { desc = "move lines up" })
map({ "v" }, "<C-j>", ":move'>+<CR>gv", { desc = "move lines down" })
map({ "v" }, "<C-h>", "<gv", { desc = "move lines left" })
map({ "v" }, "<C-l>", ">gv", { desc = "move lines right" })

map({ "n" }, ";", ":", { desc = "command enter command mode" })
map({ "n" }, "<C-q>", "<cmd>ExitSafe<CR>", { desc = "command quit vim" })
-- map({ "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "move down" })
-- map({ "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "move up" })
map({ "x" }, "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "command dont copy replaced text" })

-- buffers and windows
map("n", "<leader>w", "<cmd>update<CR>", { desc = "buffer save" })
map("n", "<leader>W", "<cmd>wa<CR>", { desc = "buffer save all" })
map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "buffer goto next" })
map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "buffer goto prev" })
map("n", "<leader><tab>", "<cmd>Telescope buffers<CR>", { desc = "buffer list" })
map("n", "<C-c>", function() require("util").close_buffer_or_window() end, { desc = "buffer close buffer or window" })
map("n", "<C-x>", function() require("nvchad.tabufline").closeBufs_at_direction() end,
    { desc = "buffer close other" })

-- nvimtree
map("n", "'", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvimtree window" })
-- map("n", "\"", "<cmd>NvimTreeFocus<CR>", { desc = "toggle focus nvimtree window" })
map("n", "\"", "<cmd>NvimTreeFocus<CR>", { desc = "toggle focus nvimtree window" })


-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fw", ":<C-U><C-R>=printf('Telescope live_grep default_text=%s', expand('<cword>'))<CR><CR>", { desc = "telescope live grep cursor word" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope find keymaps" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "telescope find commands" })

map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", function() require("nvchad.themes").open() end, { desc = "telescope nvchad themes" })
map("n", "<leader>9", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope lsp document symbols" })

-- terminal
-- map("n", "<leader>h", function() require("nvchad.term").new { pos = "sp" } end, { desc = "terminal new horizontal term" })
-- map("n", "<leader>v", function() require("nvchad.term").new { pos = "vsp" } end, { desc = "terminal new vertical term" })
map({ "n", "t" }, "<A-v>", function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end,
    { desc = "terminal toggleable vertical term" })
map({ "n", "t" }, "<A-s>", function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end,
    { desc = "terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-m>", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end,
    { desc = "terminal toggle floating term" })
-- map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<C-c>", "<C-d><cmd>q<CR>", { desc = "terminal close terminal" })

-- interestingwords
map("n", "<A-i>", "<cmd>Interestingwords --toggle<CR>", { desc = "interestingwords toggle" })
map("n", "<A-I>", "<cmd>Interestingwords --remove_all<CR>", { desc = "interestingwords remove all" })


-- translator
map("n", "<leader>t", "<Plug>TranslateW", { desc = "translate" })
map("v", "<leader>t", "<Plug>TranslateWV", { desc = "translate" })
