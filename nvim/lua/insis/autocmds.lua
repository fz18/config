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
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})
