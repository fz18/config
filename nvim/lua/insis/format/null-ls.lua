local null_ls = pRequire("null-ls")

if not null_ls then
	return
end

null_ls.setup({
	debug = false,
	sources = require("insis.utils.config-helper").getNulllsSources(),
	on_attach = function() end,
})
