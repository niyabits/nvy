--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true

-- Scroll offset
vim.o.scrolloff = 12 -- Vertical Scroll Offset
vim.o.sidescrolloff = 8 -- Horizontal Scroll Offset

vim.g.tokyonight_style = "night"
vim.cmd([[colorscheme tokyonight]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Folds
vim.wo.foldmethod     = "expr"
vim.wo.foldexpr       = "nvim_treesitter#foldexpr()"
vim.o.foldtext        = 
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.wo.fillchars      = "fold: "
vim.wo.foldnestmax    = 3
vim.wo.foldminlines   = 1 
vim.wo.foldlevel      = 99
