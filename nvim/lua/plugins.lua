local packer = require("packer")
packer.startup({
  function(use)
	  use 'wbthomason/packer.nvim'
	  use 'tanvirtin/monokai.nvim'
	  use({'nvim-tree/nvim-tree.lua', requires =  'nvim-tree/nvim-web-devicons' })
  end,
  config = {
	max_jobs = 16,

	display = {
		open_fn = function()
		    return require("packer.util").float({ border = "single"})
		end,
	},
  },
})

pcall(
[[
  autogroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  autogroup end
]]
)
