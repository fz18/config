local setup, telescope = pcall(require, "telescope")
if not setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
	return
end

telescope.setup({
	defaults = {
		layout_config = {
			horizontal = { preview_width = 0.6 },
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

function find_directory_and_focus()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local function open_nvim_tree(prompt_bufnr, _)
		actions.select_default:replace(function()
			local api = require("nvim-tree.api")

			actions.close(prompt_bufnr)
			local selection = action_state.get_selected_entry()
			api.tree.open()
			api.tree.find_file(selection.cwd .. "/" .. selection.value)
		end)
		return true
	end

	require("telescope.builtin").find_files({
		find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
		attach_mappings = open_nvim_tree,
	})
end

vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fs", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "fd", find_directory_and_focus)
