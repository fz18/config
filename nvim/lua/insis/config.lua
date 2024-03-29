---@class UserConfig
local UserConfig = {
	max_highlight_line_count = 10000,
	---@class Commonkeys
	keys = {
		leader_key = " ",
		-- quick save / quite
		n_save = "<leader>w", -- :w
		n_force_quit = "<leader>q", -- :qa!
		-- quick move
		n_v_5j = "<C-j>",
		n_v_5k = "<C-k>",
		n_v_10k = "<C-u>",
		n_v_10j = "<C-d>",
		fold = {
			open = "zo",
			close = "zc",
		},
		terminal_to_normal = "<Esc>",
	},
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
	---@class LuaConfig
	lua = {
		enable = true,
		lsp = "lua_ls",
		formatter = "stylua",
		format_on_save = true,
	},
	---@class GolangConfig
	golang = {
		enable = true,
		lsp = "gopls",
		linter = "golangci-lint",
		formatter = "gofmt",
		format_on_save = true,
	},
	---@class ToggleTermConfig
	toggleterm = {
		-- enable 3 builtin terminal <leader>t a/b/c
		enable = true,
		toggle_float_window = "<leader>ta",
		toggle_float_window_command = nil,
		toggle_side_window = "<leader>tb",
		toggle_side_window_command = nil,
		toggle_bottom_window = "<leader>tc",
		toggle_bottom_window_command = nil,
		toggle_lazigit_window = "<leader>tg",
	},
	---@class CommentConfig
	comment = {
		enable = true,
		-- normal mode
		toggler = {
			line = "gcc", -- line comment
			block = "gbc", -- block comment
		},
		-- visual mode
		opleader = {
			line = "gc",
			bock = "gb",
		},
	},
	---@class GitConfig
	gitsign = {
		enable = true,
		code_actions = "gitsigns",
		-- sign display
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	},

	---@class JsonConfig
	json = {
		enable = true,
		lsp = "jsonls",
		-- npm install -g fixjson
		---@type "fixjson" | "prettier"
		formatter = "fixjson",
		format_on_save = true,
	},
	---@class DockerConfig
	docker = {
		enable = true,
		lsp = "dockerls",
		-- npm install -g fixjson
		formatter = "fixjson",
		format_on_save = false,
	},

	---@class ClangConfig
	clang = {
		enable = true,
		lsp = "clangd",
		formatter = "clang-format",
		format_on_save = true,
	},
}

return UserConfig
