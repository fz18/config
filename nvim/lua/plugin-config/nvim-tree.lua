require("nvim-tree").setup()

local status, nvim_tree = pcall('require', "nvim-tree")
if not status then
	vim.notify("not found nvim-tree")
	return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
  update_cwd = true,
  update_focused_file = {
	enable = true,
	update_cwd = true,
  },
  -- 隐藏 . 文件
  filters = {
    dotfiles = true,
	custom = {},
  },
  view = {
	width = 40,
	side = 'left',
	mappings = {
	  list = list_keys,
	},
  -- 不显示行数
  number = false,
  relativenumber = false,
  signcolumn = 'yes',
  },

  actions = {
	open_file = {
	  resize_window = true,
	  quit_on_open = true,
	},
  },
})
