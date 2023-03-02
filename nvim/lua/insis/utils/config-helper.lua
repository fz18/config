local M = {}

M.getNulllsSources = function()
	local null_ls = pRequire("null-ls")
	if not null_ls then
		return nil
	end

	local formatting = null_ls.builtins.formatting
	local code_actions = null_ls.builtins.code_actions

	local sources = {}
	table.insert(sources, formatting.stylua)
	table.insert(sources, formatting.gofmt)
	table.insert(sources, code_actions.gitsigns)
	return sources
end

M.getMasonConfig = function()
	local cfg = require("insis.config")
	-- all supported lsp server for now
	-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
	-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
	local configMap = {
		lua_ls = require("insis.lsp.config.lua"), -- lua/lsp/config/lua.lua
		gopls = require("insis.lsp.config.gopls"), -- lua/lsp/config/lua.lua
	}

	-- enabled lsp server map
	-- key : lspconfig server name
	-- vale: lsp config file
	local servers = {}
	-- linter and formatter ensure list
	local toolList = {}

	local ensureTool = function(tool)
		if table.indexOf(toolList, tool) == -1 then
			table.insert(toolList, tool)
		end
	end

	if cfg.lua and cfg.lua.enable then
		if configMap[cfg.lua.lsp] then
			-- lua_ls
			servers[cfg.lua.lsp] = configMap[cfg.lua.lsp]
		end
		if cfg.lua.formatter == "stylua" then
			ensureTool("stylua")
		end
	end
	if cfg.golang and cfg.golang.enable then
		if configMap[cfg.golang.lsp] then
			servers[cfg.golang.lsp] = configMap[cfg.golang.lsp]
		end
		if cfg.golang.linter == "golangci-lint" then
			ensureTool("golangci-lint")
		end
	end
	-- mason lsp ensure list
	local lspList = {}
	for key, _ in pairs(servers) do
		table.insert(lspList, key)
	end
	-- log(servers)
	return lspList, servers, toolList
end

return M
