local M = {}

M.getNulllsSources = function()
	local null_ls = pRequire("null-ls")
	if not null_ls then
		return nil
	end

	local formatting = null_ls.builtins.formatting
	local code_actions = null_ls.builtins.code_actions
	local diagnostics = null_ls.builtins.diagnostics

	local sources = {}
	table.insert(sources, formatting.stylua)
	table.insert(sources, formatting.gofmt)
	table.insert(sources, formatting.shfmt)
	table.insert(sources, formatting.fixjson)
	table.insert(sources, formatting.clang_format)
	table.insert(sources, formatting.black.with({ extra_args = { "--fast" } }))
	table.insert(sources, code_actions.gitsigns)
	table.insert(sources, null_ls.builtins.code_actions.eslint_d)
	table.insert(sources, null_ls.builtins.diagnostics.eslint_d)
	table.insert(sources, require("typescript.extensions.null-ls.code-actions"))
	table.insert(
		sources,
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"graphql",
				-- "json",
				-- "yaml",
				-- "markdown",
			},
		})
	)
	return sources
end

M.getMasonConfig = function()
	-- all supported lsp server for now
	-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
	-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
	local configMap = {
		lua_ls = require("insis.lsp.config.lua"), -- lua/lsp/config/lua.lua
		gopls = require("insis.lsp.config.gopls"), -- lua/lsp/config/lua.lua
		dockerls = require("insis.lsp.config.docker"),
		jsonls = require("insis.lsp.config.json"),
		clangd = require("insis.lsp.config.clangd"),
		pyright = require("insis.lsp.config.pyright"),
		bashls = require("insis.lsp.config.bash"),
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

	servers["lua_ls"] = configMap["lua_ls"]
	servers["jsonls"] = configMap["jsonls"]
	servers["gopls"] = configMap["gopls"]
	servers["clangd"] = configMap["clangd"]
	servers["dockerls"] = configMap["dockerls"]
	servers["pyright"] = configMap["pyright"]
	servers["bashls"] = configMap["bashls"]
	ensureTool("shfmt")
	ensureTool("black")
	ensureTool("fixjson")
	ensureTool("golangci-lint")
	ensureTool("stylua")

	-- mason lsp ensure list
	local lspList = {}
	for key, _ in pairs(servers) do
		table.insert(lspList, key)
	end
	-- log(servers)
	return lspList, servers, toolList
end

return M
