local UserConfig = {
	------------------------------------
	-- shared LSP keys
	------------------------------------

	---@class LSPConfig
	lsp = {
		-- jumps to the declaration
		definition = "gd",
		-- jumps to the declaration, many servers do not implement this method
		declaration = false,
		-- displays hover information
		hover = "gh",
		-- lists all the implementations
		implementation = "gi",
		-- lists all the references to the symbol
		references = "gr",

		rename = "<leader>rn",
		code_action = "<leader>ca",
		format = "<leader>f",
		-- diagnostic
		open_flow = "go",
		goto_next = "gn",
		goto_prev = "gp",
		list = "gl",
	},

	 ---@class CMPConfig
  cmp = {
    enable = true,
    keys = {
      confirm = "<CR>",
      select_next_item = "<TAB>",
      select_prev_item = "<S-TAB>",
      scroll_doc_up = "<C-u>",
      scroll_doc_down = "<C-d>",
      complete = "<C-e>",
      abort = "<C-c>",
      -- luasnip
      snip_jump_next = "<C-l>",
      snip_jump_prev = "<C-h>",
      snip_next_choice = "<C-j>",
      snip_prev_choice = "<C-k>",
    },
  },
}

return UserConfig