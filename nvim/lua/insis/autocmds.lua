local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})

local autocmd = vim.api.nvim_create_autocmd
-- local pattern = require("insis.env").getFormatOnSavePattern()
-- table.insert(pattern, "*.sh")
-- table.insert(pattern, "*.py")
--
-- -- format on save
-- autocmd("BufWritePre", {
-- 	group = myAutoGroup,
-- 	pattern = pattern,
-- 	callback = function()
-- 		vim.lsp.buf.format({ timeout_ms = 10000 })
-- 	end,
-- })

-- go imports
autocmd("BufWritePre", {
	group = myAutoGroup,
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})
