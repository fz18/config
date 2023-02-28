local M = {}
M.version = "v0.9.1"

---@type UserConfig
M.config = require("insis.config")

--- @param user_config UserConfig
function M.setup(user_config)
  require("insis.utils.global")
  -- user config override
  M.config = vim.tbl_deep_extend("force", M.config, user_config)
  -- check packer.nvim exists
  local packer = require("insis.packer")
  if not packer.avaliable() then
    -- better to use install script to install insisVim
    packer.install()
    return
  end
  packer.setup()
  require("insis.env").init(M.config)
  require("insis.basic")
  require("insis.keybindings")
  require("insis.lsp")
  require("insis.colorscheme")
  require("insis.complete")
  require("insis.plugins")
end

return M
