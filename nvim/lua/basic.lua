-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- 光标周围保存行数
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 相对行号
vim.wo.number = true
vim.wo.relativenumber = true

--缩进空格
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 左侧图标指示列
vim.wo.signcolumn = "yes"

-- 右侧参考线
vim.wo.colorcolumn = "80"

-- 对齐
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写敏感
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不高亮
vim.o.hisearch = false

-- 边输入边搜索
vim.o.incsearch = true

-- 文件被修改时自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- smaller updatetime
vim.o.updatetime = 300

-- 键盘连击时间间隔
vim.o.timeoutlen = 300

-- split window 方向
vim.o.splitblow = true
vim.o.splitright = true

-- 不需要显示模式
vim.o.showmode = false

-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

-- 永远显示 tabline 配合插件
vim.o.showtabline = 2

-- 允许隐藏被修改的 buffer
vim.o.hidden = true
