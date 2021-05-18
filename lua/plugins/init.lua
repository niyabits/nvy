vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'folke/lsp-trouble.nvim'
    use 'mattn/efm-langserver'

    -- Completion
    use 'hrsh7th/nvim-compe'

    -- Syntax
    use 'nvim-treesitter/nvim-treesitter'
    use {'nvim-treesitter/playground', opt = true, cmd = {'TSPlayground'}}

    -- Terminal Integration
    use {
        'akinsho/nvim-toggleterm.lua',
        opt = true,
        cmd = {'ToggleTerm'},
        config = function() require 'plugins/nvim-toggleterm' end
    }

    -- Snippets
    use 'hrsh7th/vim-vsnip'

    -- Fuzzy Finder
    use 'nvim-telescope/telescope.nvim'

    -- Colorscheme
    use 'marko-cerovac/material.nvim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Lua Utils
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Tabline
    -- use 'romgrk/barbar.nvim'
    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('bufferline').setup {} end
    }

    -- Statusline
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Indent
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- File Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        opt = true,
        cmd = {
            'NvimTreeToggle', 'NvimTreeClipboard', 'NvimTreeClose',
            'NvimTreeFindFile', 'NvimTreeOpen', 'NvimTreeRefresh'
        },
        config = function() require 'plugins/nvim-tree' end
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        opt = true,
        cmd = {'Gitsigns'},
        config = function() require('gitsigns').setup() end
    }

    -- Comment
    use 'b3nj5m1n/kommentary'

    -- Editing Supports
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Keybinds
    use 'folke/which-key.nvim'
end)

