return {
	-- Packer can manage itself
	{ "wbthomason/packer.nvim" },
	-------------------------- plugins -------------------------------------------
	-- requires
	{ "nvim-tree/nvim-web-devicons" },
	{ "moll/vim-bbye" },
	{ "nvim-lua/plenary.nvim" },
	-- ("lewis6991/impatient.nvim")
	-- transparent
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("insis.plugins.nvim-transparent")
		end,
	},
	--  nvim-tmux
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	},

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("insis.plugins.nvim-tree")
		end,
	},
	-- bufferline
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("insis.plugins.bufferline")
		end,
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("insis.plugins.lualine")
		end,
	},

	-- telescope
	-- telescope extensions
	{ "LinArcX/telescope-env.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		-- opt = true,
		-- cmd = "Telescope",
		config = function()
			require("insis.plugins.telescope")
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("insis.plugins.treesitter")
		end,
	},
	{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
	{ "nvim-treesitter/nvim-treesitter-refactor", after = { "nvim-treesitter" } },
	{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
	{ "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },

	-- Comment
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		"numToStr/Comment.nvim",
		config = function()
			require("insis.plugins.comment")
			--require("Comment").setup({})
		end,
	},
	-- indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("insis.plugins.indent-blankline")
		end,
	},

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("insis.plugins.toggleterm")
		end,
	},

	-- nvim-surround
	{
		"kylechui/nvim-surround",
		config = function()
			require("insis.plugins.nvim-surround")
		end,
	},

	-- nvim-autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("insis.plugins.autopairs")
		end,
	},

	-- todo-comments.nvim
	{
		"folke/todo-comments.nvim",
		config = function()
			require("insis.plugins.todo-comments")
		end,
	},

	------------------ LSP ------------------------------------------------------

	-- Installer
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- Lspconfig
	{ "neovim/nvim-lspconfig" },
	-- Completion engine
	{ "hrsh7th/nvim-cmp" },
	-- Snippet engine
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- Completion sources
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
	{ "hrsh7th/cmp-buffer" }, -- { name = 'buffer' },
	{ "hrsh7th/cmp-path" }, -- { name = 'path' }
	{ "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }
	-- common snippets
	{ "rafamadriz/friendly-snippets" },
	-- UI improvement
	{ "onsails/lspkind-nvim" },

	------------------ Code formatter -------------------------------------------

	-- { "mhartington/formatter.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },

	------------------ Language enhancement -------------------------------------

	--------------------- colorschemes ------------------------------------------

	-- gruvbox
	{ "rktjmp/lush.nvim" },
	{ "ellisonleao/gruvbox.nvim" },

	-- monokai
	{
		"tanvirtin/monokai.nvim",
		config = function()
			require("monokai").setup()
		end,
	},

	--------------------- git ---------------------------------------------------

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("insis.plugins.gitsigns")
		end,
	},
}
