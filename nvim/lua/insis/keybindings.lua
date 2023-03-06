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
map("n", "<Leader>w", ":w<CR>", opt)
map("n", "<Leader>wa", ":wa<CR>", opt)
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opt)

map("i", "jk", "<ESC>", opt)
map("n", "<Leader>nh", ":nohl<CR>", opt)
-- map("n", "x", "_x", opt)

-- window
map("n", "<Leader>wv", "<C-w>v", opt)
map("n", "<Leader>ws", "<C-w>s", opt)
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
map("n", "<Leader>fs", "<CMD>Telescope live_grep<CR>", opt)
map("n", "<Leader>fc", "<CMD>Telescope grep_string<CR>", opt)
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", opt)
map("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", opt)
map("n", "<Leader>fi", [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], opt)

-- bufferline
map("n", "<TAB>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCycleNext<CR>", opt)

local pluginKeys = {}

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
	n = {
		["v"] = "select_vertical",
		["s"] = "file_vsplit",
	},
}

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 出现补全
		["<TAB>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<S-TAB>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- Super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}
end

return pluginKeys
