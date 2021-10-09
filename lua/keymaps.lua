-- local wk = require("which-key")
local Utils = require("utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nnoremap("<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
nnoremap("<leader>e", [[<cmd>NvimTreeToggle<CR>]])

-- Switch Tabs
nnoremap("<TAB>", ":BufferLineCycleNext<CR>")
nnoremap("<S-TAB>", ":BufferLineCyclePrev<CR>")

-- Delete Buffer
nnoremap("<A-w>", ":bd<CR>")

-- Better Visual Mode Indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move line up/down
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")

inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")

-- jk to normal mode
inoremap("jk", "<Esc>")
vnoremap("jk", "<Esc>")

-- Yank to end of line
nnoremap("Y", "y$")

-- Center Next, Prev and Line Concatenate
-- nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Add Undobreak Points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")

-- Deal with word wraps
exprnnoremap("k", "v:count == 0 ? 'gk' : 'k'")
exprnnoremap("j", "v:count == 0 ? 'gj' : 'j'")

-- Terminal
tnoremap("<Esc>", "<C-\\><C-n>")
tnoremap("<A-`>", "<C-\\><C-n> :ToggleTerm<CR>")
nnoremap("<A-`>", ":ToggleTerm<CR>")

-- Toggle Comment: kommentary
vim.api.nvim_set_keymap("n", "<C-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-/>", "<Plug>kommentary_visual_default", {})

vim.api.nvim_set_keymap("n", "<A-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<A-/>", "<Plug>kommentary_visual_default", {})
