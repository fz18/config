local lspconfig = pRequire("lspconfig")
--
-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end
local common = require("insis.lsp.common-config")

if not lspconfig then
	return
end

local servers = {
	lua_ls = require("insis.lsp.config.lua"), -- lua/lsp/config/lua.lua
	gopls = require("insis.lsp.config.gopls"), -- lua/lsp/config/lua.lua
	dockerls = require("insis.lsp.config.docker"),
	jsonls = require("insis.lsp.config.json"),
	clangd = require("insis.lsp.config.clangd"),
	pyright = require("insis.lsp.config.pyright"),
	bashls = require("insis.lsp.config.bash"),
}

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

typescript.setup({
	server = {
		capabilities = common.capabilities,
		on_attach = function(client, bufnr)
			common.disableFormat(client)
			common.ONAttach(client, bufnr)
		end,
	},
})

lspconfig["html"].setup({
	capabilities = common.capabilities,
	on_attach = common.ONAttach,
})

lspconfig["cssls"].setup({
	capabilities = common.capabilities,
	on_attach = common.ONAttach,
})

lspconfig["emmet_ls"].setup({
	capabilities = common.capabilities,
	on_attach = common.ONAttach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

require("insis.lsp.ui")
require("insis.lsp.saga")
