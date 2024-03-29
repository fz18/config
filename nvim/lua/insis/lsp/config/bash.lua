local common = require("insis.lsp.common-config")
local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disableFormat(client)
		common.ONAttach(client, bufnr)
	end,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
