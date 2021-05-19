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
    use 'glepnir/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'
    use 'onsails/lspkind-nvim'
    use {
        'folke/lsp-trouble.nvim',
        opt = true,
        cmd = {'Trouble', 'TroubleClose', 'TroubleRefresh', 'TroubleToggle'}
    }
    use 'mattn/efm-langserver'
    use {
        'simrat39/symbols-outline.nvim',
        opt = true,
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose'}
    }

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
    -- TODO : Switch to snipperts.nvim
    use 'hrsh7th/vim-vsnip'

    -- Fuzzy Finder
    -- TODO: Make Telescope an opt plugin
    use 'nvim-telescope/telescope.nvim'

    -- Colorscheme
    use 'marko-cerovac/material.nvim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Lua Utils
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Tabline
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

    use {'TimUntersberger/neogit', opt = true, cmd = {'Neogit'}}

    use {
        'sindrets/diffview.nvim',
        opt = true,
        cmd = {
            'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles',
            'DiffviewFocusFiles', 'DiffviewRefresh'
        }
    }

    use {'lewis6991/gitsigns.nvim', opt = true, cmd = {'Gitsigns'}}

    -- Comment
    use 'b3nj5m1n/kommentary'

    -- QuickFix
    use 'kevinhwang91/nvim-bqf'

    -- Editing Supports
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {'folke/zen-mode.nvim', opt = true, cmd = {'ZenMode'}}

    -- Keybinds
    use 'folke/which-key.nvim'
end)

