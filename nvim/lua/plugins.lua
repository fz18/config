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
	  -- 补全引擎
	  use("hrsh7th/nvim-cmp")
	  -- snippet 引擎
      use ("L3MON4D3/LuaSnip")
	  -- 补全源
	  use("hrsh7th/cmp-vsnip")
	  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	  use("hrsh7th/cmp-path") -- { name = 'path' }
	  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

	  -- 常见编程语言代码段
	  use("rafamadriz/friendly-snippets")
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
