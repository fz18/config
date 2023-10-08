local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

vim.opt.termguicolors = true

-- open nvim-tree on setup
local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

local function change_root_to_global_cwd()
	local api = require("nvim-tree.api")
	local global_cwd = vim.fn.getcwd(-1, -1)
	api.tree.change_root(global_cwd)
end
--
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "O", "", { buffer = bufnr })
	vim.keymap.del("n", "O", { buffer = bufnr })
	vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
	vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
	vim.keymap.set("n", "D", "", { buffer = bufnr })
	vim.keymap.del("n", "D", { buffer = bufnr })
	vim.keymap.set("n", "E", "", { buffer = bufnr })
	vim.keymap.del("n", "E", { buffer = bufnr })

	vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "P", function()
		local node = api.tree.get_node_under_cursor()
		print(node.absolute_path)
	end, opts("Print Node Path"))

	vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("open or edit"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("open or edit"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("parent and close"))
	vim.keymap.set("n", "<C-c>", change_root_to_global_cwd, opts("Change Root To Global CWD"))
end

nvimtree.setup({
	on_attach = my_on_attach,
	view = {
		width = 30,
		side = "left",
		-- 不显示行数
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = false,
	},
})
