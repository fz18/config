--- @param config ClangConfig
return function(config)
	return {
		getFormatOnSavePattern = function()
			if config.format_on_save then
				return { "*.c" }
			end
			return {}
		end,

		getTSEnsureList = function()
			return { "c" }
		end,

		getLSPEnsureList = function()
			if config.lsp == "clangd" then
				return { "clangd" }
			end
			return {}
		end,

		getLSPConfigMap = function()
			if config.lsp == "clangd" then
				return {
					lua_ls = require("insis.lsp.config.clang"), -- lua/lsp/config/lua.lua
				}
			end
			return {}
		end,

		getToolEnsureList = function()
			if config.formatter == "clang-format" then
				return { "clang-format" }
			end
			return {}
		end,

		getNulllsSources = function()
			local null_ls = pRequire("null-ls")
			if not null_ls then
				return {}
			end
			if config.formatter == "clang-format" then
				return { null_ls.builtins.formatting.clang_format }
			end
			return {}
		end,

		getNeotestAdapters = function()
			return {}
		end,
	}
end
