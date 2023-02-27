-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  extentions = { "nvim-tree" },
  sections = {
    lualine_c = {
	  'filesize',
	  {
		"fileformat",
		symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
	  },
	  "encoding",
	  "filetype",
	},
  }
}
