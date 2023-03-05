local M = {}
M.version = "v0.9.1"

---@type UserConfig
M.config = require("insis.config")

--- @param user_config UserConfig
function M.setup(user_config)
	require("insis.utils.global")
	-- user config override
	M.config = vim.tbl_deep_extend("force", M.config, user_config)
	require("insis.packer")
	require("insis.env").init(M.config)
	require("insis.basic")
	require("insis.keybindings")
	require("insis.lsp")
	require("insis.colorscheme")
	require("insis.complete")
	require("insis.format")
	require("insis.autocmds")
	require("insis.plugins.gitsigns")
	require("insis.lsp.mason")
end

return M
