local common = require("insis.lsp.common-config")
local opts = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = common.ONAttach,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
