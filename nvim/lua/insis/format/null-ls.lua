local null_ls = pRequire("null-ls")

if not null_ls then
	return
end

null_ls.setup({
	debug = false,
	-- sources = {
	-- 	null_ls.builtins.formatting.stylua,
	-- 	null_ls.builtins.formatting.gofmt,
	-- 	null_ls.builtins.formatting.fixjson,
	-- },
	sources = require("insis.env").getNulllsSources(),
	on_attach = function() end,
})
