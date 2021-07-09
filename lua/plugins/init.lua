local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Plugin Manager
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'folke/lsp-colors.nvim'
    use 'onsails/lspkind-nvim'
    -- TODO : Make Trouble opt plugin
    use 'folke/lsp-trouble.nvim'
    use 'mattn/efm-langserver'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use {
        'simrat39/symbols-outline.nvim',
        opt = true,
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose'}
    }

    -- LSP Installers
    use 'anott03/nvim-lspinstall'

    -- Completion
    use 'hrsh7th/nvim-compe'

    -- Syntax
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'

    -- Terminal Integration
    use {
        'akinsho/nvim-toggleterm.lua',
        opt = true,
        cmd = {'ToggleTerm'},
        config = function() require 'plugins/nvim-toggleterm' end
    }

    -- Snippets
    -- TODO : Switch to snipperts.nvim
    use 'hrsh7th/vim-vsnip'

    -- Fuzzy Finder
    -- TODO: Make Telescope an opt plugin
    use 'nvim-telescope/telescope.nvim'

    -- Colors
    use 'norcalli/nvim-colorizer.lua'

    -- Colorscheme
    use 'marko-cerovac/material.nvim'
    use 'yashguptaz/calvera-dark.nvim'

    -- Utility
    use 'famiu/nvim-reload'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Lua Utils
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Tabline
    use {
        'akinsho/nvim-bufferline.lua',
        config = function() require('bufferline').setup {} end
    }

    -- Statusline
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Indent
    use {'lukas-reineke/indent-blankline.nvim'}

    -- File Explorer
    use {'kyazdani42/nvim-tree.lua'}

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use {
        'TimUntersberger/neogit',
        opt = true,
        cmd = {'Neogit'},
        config = function()
            require('neogit').setup {integrations = {diffview = true}}
        end
    }

    use {
        'sindrets/diffview.nvim',
        opt = true,
        cmd = {
            'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles',
            'DiffviewFocusFiles', 'DiffviewRefresh'
        }
    }

    -- Programming Language Support
    use 'pantharshit00/vim-prisma'
    use 'aca/emmet-ls'

    -- Comment
    use 'b3nj5m1n/kommentary'

    -- QuickFix
    use 'kevinhwang91/nvim-bqf'

    -- Motions
    use 'ggandor/lightspeed.nvim'

    -- Editing Supports
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
        "Pocco81/TrueZen.nvim",
        opt = true,
        cmd = {'TZMinimalist', 'TZFocus', 'TZAtaraxis'}
    }

    -- Keybinds
    use 'folke/which-key.nvim'

    -- Startscreen
    use 'glepnir/dashboard-nvim'
end)

