vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- visual 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
map("n", "<Leader>w", ":w<CR>", opt)

local pluginKeys = {}
-- nvim-tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件夹
  { key = {"l", "<CR>", "o"}, action = "vsplit" },
  -- 分屏打开
  { key = "v", action = "vsplit" },
  { key = "s", action = "vsplit" },
  -- 显示隐藏文件
  { key = ".", action = "toggle_dotfiles" },
  -- 文件操作
  { key = "c", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "y", action = "copy" },
  { key = "p", action = "paste" },
  { key = "so", action = "system_open" },
}

return pluginKeys
