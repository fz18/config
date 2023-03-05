local null_ls = pRequire("null-ls")

if not null_ls then
	return
end

local sources = require("insis.utils.config-helper").getNulllsSources()

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = function() end,
})
