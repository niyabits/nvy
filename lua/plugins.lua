-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim") -- Package manager
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
				},
			})
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({})
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("marko-cerovac/material.nvim")
	use("folke/tokyonight.nvim")
	use("nvim-lualine/lualine.nvim")
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({})
		end,
	})
	use({
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
	})
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- LSP Stuff
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins/null-ls")
		end,
	})
	use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("nathom/filetype.nvim")
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({})
		end,
	})
	use("b3nj5m1n/kommentary")
	use("williamboman/nvim-lsp-installer")
end)
