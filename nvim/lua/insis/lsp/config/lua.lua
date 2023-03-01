local common = require("insis.lsp.common-config")
local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
	on_attach = function(client, bufnr)
		common.format(client, bufnr)
		common.keyAttach(bufnr)
	end,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
