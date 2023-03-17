local M = {}

M.ONAttach = function(client, bufnr)
	local opt = { noremap = true, silent = true, buffer = bufnr }

	-- TODO: move to config.diagnostic
	-- diagnostic
	keymap("n", "gl", "<CMD>lua Telescope loclist<CR>")
	keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opt) -- show definition, references
	keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opt) -- see definition and make edits in window
	--
	-- -- lsp
	keymap("n", "gd", require("telescope.builtin").lsp_definitions, opt)
	keymap("n", "gs", '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', opt)
	keymap("n", "gh", vim.lsp.buf.hover, opt)
	keymap("n", "gi", require("telescope.builtin").lsp_implementations, opt)
	keymap(
		"n",
		"gr",
		"<CMD>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>",
		opt
	)

	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt) -- see available code actions
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt) -- smart rename
	keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opt) -- show  diagnostics for line
	keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opt) -- show diagnostics for cursor
	keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt) -- jump to previous diagnostic in buffer
	keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt) -- jump to next diagnostic in buffer
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt) -- show documentation for what is under cursor
	keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opt) -- see outline on right hand side
	keymap("n", "<leader>f", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", opt)

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- 禁用格式化功能，交给专门插件插件处理
M.disableFormat = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.flags = {
	debounce_text_changes = 150,
}

return M
