local cfg = require("insis").config
local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- format on save
autocmd("BufWritePre", {
	group = myAutoGroup,
	pattern = require("insis.env").getFormatOnSavePattern(),
	callback = function()
		vim.lsp.buf.format({ timeout_ms = 10000 })
	end,
})

-- go imports
autocmd("BufWritePre", {
	group = myAutoGroup,
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})
