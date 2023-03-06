local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- 窗口内快捷键
		-- mappings = require("insis.keybindings").telescopeList,
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
			n = {
				["v"] = "select_vertical",
				["s"] = "file_vsplit",
				["q"] = "close",
			},
		},
	},
})

-- telescope extensions
pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "goimpl")
