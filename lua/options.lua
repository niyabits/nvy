vim.cmd('set number')					-- Show Line Number
vim.cmd('set relativenumber')			-- Relative Line Number
vim.cmd('set incsearch')				-- Incremental Search
vim.cmd('set nohlsearch')				-- No Highlight after Search
vim.cmd('set noswapfile')				-- No Swap File after closing Buffer
vim.cmd('set smartcase')				-- Case Insensitive Search for all Small Chars
vim.cmd('set tabstop=4 softtabstop=4')
vim.cmd('set shiftwidth=2')

vim.o.hidden = true						-- Allow Unsaved Tabs
vim.o.mouse = "a"						-- Mouse Support
vim.o.scrolloff = 8						-- Scroll Before Cursor reaches Edge
vim.o.termguicolors = true				-- GUI Colors
vim.o.showtabline = 2					-- Always Show Tabline
vim.o.clipboard = "unnamedplus"			-- Copy Paste
vim.o.completeopt = "menuone,noselect"  -- Required by nvim-compe
vim.o.updatetime = 300 

vim.wo.number = true					-- Line Numbers
vim.wo.cursorline = true				-- Highlight Cursor Location

vim.bo.autoindent = true				-- Copy Indent to Next Line
vim.bo.smartindent = true				-- Smart Indent for C-like langs
