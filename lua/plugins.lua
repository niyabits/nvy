vim.cmd([[packadd packer.nvim]]) -- Load Packer

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true }) -- Packer Itself

	use("yashguptaz/calvera-dark.nvim") -- Theme
	use("folke/tokyonight.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins/telescope")
		end,
	}) -- ctrl+p

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins/nvim-tree")
		end,
	}) -- File Explorer

	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = { { filetype = "NvimTree" } },
				},
			})
		end,
		event = "BufWinEnter",
	})

	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("plugins/lualine")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins/treesitter")
		end,
	})

	use("nvim-treesitter/nvim-treesitter-textobjects")

	use({ "nvim-treesitter/playground" })

	use({ "nvim-treesitter/nvim-treesitter-refactor" })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				map_cr = true, --  map <CR> on insert mode
				map_complete = true, -- it will auto insert `(` after select function or method item
				auto_select = true, -- automatically select the first item
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lspconfig")
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins/cmp")
		end,
	})

	use({
		"onsails/lspkind-nvim",
		config = function()
			require("plugins/lspkind")
		end,
	})

	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").update_lightbulb()
			vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
		end,
	})

	use("rafamadriz/friendly-snippets")

	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	-- Java
	use("mfussenegger/nvim-jdtls")

	use("simrat39/symbols-outline.nvim")

	use({
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup()
		end,
	})

	use({
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	})

	use({
		"sindrets/diffview.nvim",
		config = function()
			local cb = require("diffview.config").diffview_callback
			require("diffview").setup({})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns")
		end,
	})

	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup({})
		end,
	})

	use("github/copilot.vim")

	use("tpope/vim-fugitive")

	use({
		"b3nj5m1n/kommentary",
		event = "BufRead",
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("plugins/which-key")
		end,
		event = "BufWinEnter",
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins/indent-blankline")
		end,
	})

	use({ "akinsho/nvim-toggleterm.lua", event = "BufWinEnter" })

	use({ "iamcco/markdown-preview.nvim" })

	use("ggandor/lightspeed.nvim")

	use("styled-components/vim-styled-components")

	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("package-info").setup()
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppress_dirs = { "~/" },
			})
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({})
		end,
	})
end)
