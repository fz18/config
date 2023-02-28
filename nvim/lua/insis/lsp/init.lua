local mason = pRequire("mason")
local mason_config = pRequire("mason-lspconfig")
local lspconfig = pRequire("lspconfig")
local mason_tool = pRequire("mason-tool-installer")

if not mason or not mason_config or not lspconfig or not mason_tool then
  return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
local lspList, servers, toolList = require("insis.utils.config-helper").getMasonConfig()

mason_config.setup({
  ensure_installed = require("insis.env").getLSPEnsureList(),
})

mason_tool.setup({
  ensure_installed = require("insis.env").getToolEnsureList(),
})

-- 安装列表
--{ key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name])
	else
		-- 使用默认参数
		lspconfig[name].setup({})
	end
end
require("insis.lsp.ui")
