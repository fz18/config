local M = {}

M.keyAttach = function(bufnr)
	local lsp = require("insis").config.lsp
	local opt = { noremap = true, silent = true, buffer = bufnr }

	-- TODO: move to config.diagnostic
	-- diagnostic
	keymap("n", lsp.open_flow, "<CMD>lua vim.diagnostic.open_float()<CR>")
	keymap("n", lsp.goto_next, "<CMD>lua vim.diagnostic.goto_next()<CR>")
	keymap("n", lsp.goto_prev, "<CMD>lua vim.diagnostic.goto_prev()<CR>")
	keymap("n", lsp.list, "<CMD>lua Telescope loclist<CR>")

	-- lsp
	keymap("n", lsp.definition, require("telescope.builtin").lsp_definitions, opt)
	keymap("n", lsp.declaration, vim.lsp.buf.declaration, opt)
	keymap("n", lsp.hover, vim.lsp.buf.hover, opt)
	keymap("n", lsp.implementation, require("telescope.builtin").lsp_implementations, opt)
	keymap(
		"n",
		lsp.references,
		"<CMD>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>",
		opt
	)

	keymap("n", lsp.rename, "<CMD>lua vim.lsp.buf.rename()<CR>", opt)
	keymap("n", lsp.code_action, "<CMD>lua vim.lsp.buf.code_action()<CR>", opt)
	keymap("n", lsp.format, "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", opt)
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.format = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
	debounce_text_changes = 150,
}

return M
