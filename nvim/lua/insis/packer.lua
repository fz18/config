local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source % | PackerSync
  augroup end
]])

local pluginList = require("insis.plugins.plugins-setup")
local packer_bootstrap = ensure_packer() -- true if packer was just installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("require packer.nvim failed")
	return
end
packer.reset()
packer.startup({
	function(use)
		for _, plugin in ipairs(pluginList) do
			use(plugin)
		end
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
