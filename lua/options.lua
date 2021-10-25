-- stylua: ignore start
-- Visual
vim.o.conceallevel    = 0 	    -- Make `` Visible in Markdown
vim.o.cmdheight       = 1	    -- Better Error Messages
vim.o.showtabline     = 2 	    -- Always Show Tabline
vim.o.pumheight       = 10      -- Pop up Menu Height
vim.wo.number         = true 	-- Display Line Number 
vim.wo.relativenumber = true 	-- Make relative line numbers default
vim.o.termguicolors   = true	-- Set Terminal Colors
vim.o.title           = true    -- Display File Info on Title
vim.o.showmode        = false	-- Don't Show MODES
vim.wo.signcolumn     = 'yes'	-- Sign Column

-- Behavior
vim.o.hlsearch        = false 	-- Set highlight on search
vim.o.ignorecase      = true 	-- Case insensitive searching 
vim.o.smartcase       = true	-- If Upper Case Char > case sensitive search
vim.o.smarttab       = true	-- Smart Tabs
vim.o.smartindent     = true 	-- Smart Indenting
vim.o.splitbelow      = true 	-- Force Split Below
vim.o.splitright      = true 	-- Force Split Right
vim.o.expandtab       = true
vim.o.tabstop         = 2	    -- Tabstop 
vim.o.softtabstop     = 2
vim.o.shiftwidth      = 2
vim.o.scrolloff       = 12  	    -- Vertical Scroll Offset
vim.o.sidescrolloff   = 8  	    -- Horizontal Scroll Offset
vim.o.mouse           = 'a'	    -- Enable mouse mode

-- Vim specific
vim.o.hidden          = true	    -- Do not save when switching buffers
vim.o.breakindent     = true	    -- Enable break indent
vim.o.backup          = false	    -- Disable Backup
vim.o.swapfile        = false	    -- Don't create Swap Files
vim.o.spell           = false
vim.o.undofile        = true 	    -- Save undo history
vim.o.updatetime      = 250	        -- Decrease update time
vim.o.timeoutlen      = 250	        -- Time for mapped sequence to complete (in ms)
vim.o.inccommand      = 'nosplit'   -- Incremental live completion
vim.o.fileencoding    = "utf-8"	    -- Set File Encoding
vim.o.spelllang       = "en"
vim.o.completeopt     = "menuone,noselect"  -- Autocompletion
vim.o.shortmess       = "c"
vim.o.undodir         = vim.fn.stdpath("cache") .. "/undo"
-- stylua: ignore end

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)
