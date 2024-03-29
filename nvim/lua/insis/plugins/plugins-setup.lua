return {
	-- Packer can manage itself
	{ "wbthomason/packer.nvim" },
	-------------------------- plugins -------------------------------------------
	-- requires
	{ "nvim-tree/nvim-web-devicons" },
	{ "moll/vim-bbye" },
	{ "nvim-lua/plenary.nvim" },
	-- ("lewis6991/impatient.nvim")

	{ "szw/vim-maximizer" }, -- maximizes and restores current window
	{ "b0o/schemastore.nvim" },

	{
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	--  nvim-tmux
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
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
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{
		"nvim-telescope/telescope.nvim",
		-- opt = true,
		-- cmd = "Telescope",
		config = function()
			require("insis.plugins.telescope")
		end,
	},

	-- Comment
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		"numToStr/Comment.nvim",
		config = require("insis.plugins.comment"),
	},
	-- indent-blankline
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		require("insis.plugins.indent-blankline")
	-- 	end,
	-- },

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("insis.plugins.toggleterm")
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
	{
		"skywind3000/asyncrun.vim",
		as = "asyncrun",
		config = function()
			require("asyncrun_toggleterm").setup({
				mapping = "<leader>tt",
				start_in_insert = false,
			})
		end,
	},
	{
		"preservim/vimux",
	},

	------------------ LSP ------------------------------------------------------

	-- Installer
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	--
	-- Lspconfig
	{ "neovim/nvim-lspconfig" },
	-- Completion engine
	{ "hrsh7th/nvim-cmp" },
	--
	-- Snippet engine
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" }, -- useful snippets

	-- Completion sources
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
	{ "hrsh7th/cmp-buffer" }, -- { name = 'buffer' },
	{ "hrsh7th/cmp-path" }, -- { name = 'path' }
	{ "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }
	{
		"ray-x/lsp_signature.nvim",
	},
	--
	-- UI improvement
	{ "onsails/lspkind-nvim" },
	{
		"jose-elias-alvarez/typescript.nvim",
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Go
	{
		"ray-x/go.nvim",
		"edolphin-ydf/goimpl.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	------------------ Code formatter -------------------------------------------

	-- { "mhartington/formatter.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls
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

	------------------ Language enhancement -------------------------------------
	{ "simrat39/symbols-outline.nvim" },

	--------------------- colorschemes ------------------------------------------

	-- gruvbox
	{ "rktjmp/lush.nvim" },
	{ "ellisonleao/gruvbox.nvim" },

	-- monokai
	{
		"tanvirtin/monokai.nvim",
	},

	{
		"folke/tokyonight.nvim",
	},
	-- sonokai
	{
		"sainnhe/sonokai",
	},
	-------------------- git ------------------------------
	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
}
