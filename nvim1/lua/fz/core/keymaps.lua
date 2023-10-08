vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- visual 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa<CR>", opt)
map("n", "<Leader>fs", ":w<CR>", opt)
map("n", "<Leader>wa", ":wa<CR>", opt)
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opt)

map("i", "jk", "<ESC>", opt)
map("n", "<Leader>nh", ":nohl<CR>", opt)

-- window
map("n", "<Leader>wv", "<C-w>v", opt)
map("n", "<Leader>wh", "<C-w>s", opt)
map("n", "<Leader>we", "<C-w>=", opt)
map("n", "<Leader>wx", ":close<CR>", opt)

map("n", "<Leader>to", ":tabnew<CR>", opt)
map("n", "<Leader>tx", ":tabclose<CR>", opt)
map("n", "<Leader>tn", ":tabn<CR>", opt)
map("n", "<Leader>tp", ":tabp<CR>", opt)

-------------------
-- Plugin Keybinds
-- ----------------

-- vim-maximizer
map("n", "<Leader>wm", ":MaximizerToggle<CR>", opt)

-- Telescope
map("n", "<C-p>", "<CMD>Telescope find_files<CR>", opt)
map("n", "<C-f>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opt)
map("n", "<C-F>", "<CMD>Telescope live_grep<CR>", opt)
map("n", "<Leader>fc", "<CMD>Telescope grep_string<CR>", opt)
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opt)
map("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", opt)
map("n", "<Leader>fi", [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], opt)

-- bufferline
map("n", "<TAB>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<Leader>bc", ":Bdelete!<CR>", opt)
map("n", "<Leader>bp", ":BufferLinePickClose<CR>", opt)
