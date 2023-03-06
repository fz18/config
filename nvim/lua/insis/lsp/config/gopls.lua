local common = require("insis.lsp.common-config")
local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.ONAttach(client, bufnr)
		common.disableFormat(client)
	end,
	-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
	-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
