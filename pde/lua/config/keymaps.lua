vim.g.maplocalleader = " "
local keymap = vim.keymap.set
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- visual 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

map("n", "<Leader>q", ":q<CR>", opt)
map("n", "<Leader>Q", ":qa<CR>", opt)
map("n", "<Leader>w", ":w<CR>", opt)
map("n", "<Leader>wa", ":wa<CR>", opt)
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opt)

map("i", "jk", "<ESC>", opt)
map("n", "<Leader>nh", ":nohl<CR>", opt)

-- window
-- map("n", "<Leader>wv", "<C-w>v", opt)
-- map("n", "<Leader>wh", "<C-w>s", opt)
-- map("n", "<Leader>we", "<C-w>=", opt)
-- map("n", "<Leader>wx", ":close<CR>", opt)

map("n", "<Leader>to", ":tabnew<CR>", opt)
map("n", "<Leader>tx", ":tabclose<CR>", opt)
map("n", "<Leader>tn", ":tabn<CR>", opt)
map("n", "<Leader>tp", ":tabp<CR>", opt)

-- copy
map("v", "<Leader>y", '"+y', opt)
-------------------
-- Plugin Keybinds
-- ----------------

map("n", "<leader>gf", [[<cmd>lua require'plugins.telescope.pickers'.git_diff_picker{}<CR>]], opt)
-- vim-maximizer
map("n", "<Leader>wm", ":MaximizerToggle<CR>", opt)

-- Auto indent
keymap("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })
