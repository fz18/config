local packer = require("packer")
packer.startup({
  function(use)
	  use 'wbthomason/packer.nvim'
	  use 'tanvirtin/monokai.nvim'
	  use({'nvim-tree/nvim-tree.lua', requires =  'nvim-tree/nvim-web-devicons' })
	  use { "alexghergh/nvim-tmux-navigation" }
	  -- using packer.nvim
	  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
	  use { 'nvim-telescope/telescope.nvim', requires =  {'nvim-lua/plenary.nvim'} }
	  -- telescope extensions
	  use "LinArcX/telescope-env.nvim"
	  -- treesitter
	  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	  -- 可以移除掉背景色，让 vim 透明
	  use 'xiyaowong/nvim-transparent' 
	  --------------LSP ----------------------
	  -- Lspconfig
	  use({ "neovim/nvim-lspconfig" })
	  -- LS installer
	  use({ "williamboman/mason.nvim" })
	  use({ "williamboman/mason-lspconfig.nvim" })
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
