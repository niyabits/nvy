return require('packer').startup(function()
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'folke/lsp-trouble.nvim'
    use 'mattn/efm-langserver'

    -- LSP Installer
    use 'kabouzeid/nvim-lspinstall'

    -- Completion
    use 'hrsh7th/nvim-compe'

    -- Syntax
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-treesitter/playground'

    -- Terminal Integration
    use 'akinsho/nvim-toggleterm.lua'

    -- Snippets
    use 'hrsh7th/vim-vsnip'

    -- Fuzzy Finder
    use 'nvim-telescope/telescope.nvim'

    -- Colorscheme
    use 'marko-cerovac/material.nvim'
    use 'folke/tokyonight.nvim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'mhartington/oceanic-next'
    use 'lewis6991/moonlight.vim'
	use 'christianchiarulli/nvcode-color-schemes.vim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    -- use 'yamatsum/nvim-nonicons'

    -- Lua Utils
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Tabline
    use 'romgrk/barbar.nvim'

    -- Statusline
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Indent
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'TimUntersberger/neogit'
    use 'ruifm/gitlinker.nvim'

    -- Comment
    use 'b3nj5m1n/kommentary'

    -- Quickfix
    use 'kevinhwang91/nvim-bqf'

    -- Editing Supports
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Sessions
    use 'rmagatti/auto-session'

    -- Keybinds
    use 'folke/which-key.nvim'
end)

