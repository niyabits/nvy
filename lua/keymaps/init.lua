local Utils = require('keymaps/utils')
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

----------
-- Vim --
---------

-- Map Leader key
nnoremap('<Space>', '<NOP>')
vim.g.mapleader = ' '

-- CTRL + C   ->   ESC
nnoremap('<C-c>', '<Esc>')

-- Better Visual Mode Indent
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- CTRL + S  ->  Save
nnoremap('<C-s>', ':w<CR>')
inoremap('<C-s>', '<Esc>:w<CR>gi')

-- Source Configuration
nnoremap('<leader><CR>', ':luafile %<CR>')

-- Semicolon to Run Commands
nnoremap(';', ':')
vnoremap(';', ':')

-- , + p to paste the Yank register
nmap(',p', '"0p')
nmap(',P', '"0P')

--------------
-- General --
--------------

nnoremap('<C-S-p>', ':echo \'Show Command Pallet\'<CR>')
nnoremap('<C-,>', ':echo \'User Settings \'<CR>')

-------------------
-- Basic Editing --
-------------------

-- Alt + k / j          Move line up/down
xnoremap('<A-j>', ':move \'>+1<CR>gv-gv')
xnoremap('<A-k>', ':move \'<-2<CR>gv-gv')

nnoremap('<A-j>', ':m .+1<CR>==')
nnoremap('<A-k>', ':m .-2<CR>==')

inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')

-- Toggle Comment
vim.api.nvim_set_keymap("n", "<C-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-/>", "<Plug>kommentary_visual_default", {})

----------------
-- Navigation --
----------------

nnoremap('<C-p>', ':Telescope git_files<CR>')

------------------------
-- Search and Replace --
------------------------

--------------------------------
-- Multi-cursor and Selection --
--------------------------------

---------------------------
-- Rich language editing --
---------------------------

-- Async LSP Finder
nnoremap('gh', ':Lspsaga lsp_finder<CR>')

-- Code Action
nnoremap('<leader>ca', ':Lspsaga code_action<CR>')
vnoremap('<leader>ca', ':<C-U>Lspsaga range_code_action<CR>')

-- Hover Doc
nnoremap('K', ':Lspsaga hover_doc<CR>')

-- scroll down hover doc or scroll in definition preview
nnoremap('<C-f>',
         '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
-- scroll up hover doc
nnoremap('<C-b>',
         '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')

-- Signature Help
nnoremap('gs', ':Lspsaga signature_help<CR>')

-- Rename
nnoremap('gr', ':Lspsaga rename<CR>')

-- Preview Definition
nnoremap('gd', ':Lspsaga preview_definition<CR>')

-- Show Diagnostic
nnoremap('ge', ':Lspsaga show_cursor_diagnostics<CR>')
vim.cmd(
    'autocmd CursorHold * lua require\'lspsaga.diagnostic\'.show_cursor_diagnostics()')

-- Jump Diagnostic
nnoremap('<F8>', ':Lspsaga diagnostic_jump_next<CR>')
nnoremap('S-<F8>', ':Lspsaga diagnostic_jump_prev<CR>')

-- Goto Definition
nnoremap('gD', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- Goto implementation
nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

-- LSP Trouble
nnoremap('<leader>xx', '<cmd>LspTroubleToggle<cr>')
nnoremap('<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>')
nnoremap('<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagnostics<cr>')
nnoremap('<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>')
nnoremap('<leader>xl', '<cmd>LspTroubleToggle loclist<cr>')
nnoremap('gR', '<cmd>LspTroubleToggle lsp_references<cr>')

-----------------------
-- Editor Management --
-----------------------

-- Close Editor
nnoremap('<C-w>', ':BufferClose<CR>')
inoremap('<C-w>', '<Esc>:BufferClose<CR>i')

-- Split Editor
nnoremap('<C-\\>', ':vsplit<CR>')
nnoremap('<C-S-\\>', ':split<CR>')
inoremap('<C-\\>', '<Esc>:vsplit<CR>i')
inoremap('<C-S-\\>', '<Esc>:split<CR>i')

-- Navigate Between Windows
nnoremap('<C-h>', ':wincmd h<CR>')
nnoremap('<C-j>', ':wincmd j<CR>')
nnoremap('<C-k>', ':wincmd k<CR>')
nnoremap('<C-l>', ':wincmd l<CR>')

inoremap('<C-h>', '<Esc>:wincmd h<CR>i')
inoremap('<C-j>', '<Esc>:wincmd j<CR>i')
inoremap('<C-k>', '<Esc>:wincmd k<CR>i')
inoremap('<C-l>', '<Esc>:wincmd l<CR>i')

nnoremap('<left>', ':wincmd h<CR>')
nnoremap('<down>', ':wincmd j<CR>')
nnoremap('<up>', ':wincmd k<CR>')
nnoremap('<right>', ':wincmd l<CR>')

-- Resize
-- M is the ALT key
nnoremap('<M-h>', ':vertical resize -2<CR>')
nnoremap('<M-l>', ':vertical resize +2<CR>')
nnoremap('<C-M-j>', ':resize +2<CR>')
nnoremap('<C-M-k>', ':resize -2<CR>')

---------------------
-- File Management --
---------------------

nnoremap('<TAB>', ':BufferPrevious<CR>')
nnoremap('<S-TAB>', ':BufferNext<CR>')

-------------
-- Display --
-------------
nnoremap('<C-e>', ':NvimTreeToggle<CR>')

-----------
-- Debug --
-----------

-------------------------
-- Integrated Terminal --
-------------------------

tnoremap('<Esc>', '<C-\\><C-n>')
tnoremap('<A-`>', '<C-\\><C-n> :ToggleTerm<CR>')
nnoremap('<A-`>', ':ToggleTerm<CR>')
