local null_ls = pRequire("null-ls")

if not null_ls then
	return
end

local sources = require("insis.env").getNulllsSources()

-- custom source
table.insert(sources, null_ls.builtins.code_actions.gitsigns)
table.insert(sources, null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }))
table.insert(sources, null_ls.builtins.formatting.shfmt)

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = function() end,
})
