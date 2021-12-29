--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Add leader shortcuts
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-p>",
	[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sb",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>st",
	[[<cmd>lua require('telescope.builtin').tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>?",
	[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>e", [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>g", [[<cmd>Neogit<CR>]], { noremap = true, silent = true })

function noremap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function nnoremap(lhs, rhs)
	noremap("n", lhs, rhs)
end

function vnoremap(lhs, rhs)
	noremap("v", lhs, rhs)
end

-- Copy to system clipboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- Switch Buffers
nnoremap("<TAB>", ":BufferLineCycleNext<CR>")
nnoremap("<S-TAB>", ":BufferLineCyclePrev<CR>")

-- Toggle Comment: kommentary
vim.api.nvim_set_keymap("n", "<C-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-/>", "<Plug>kommentary_visual_default", {})

vim.api.nvim_set_keymap("n", "<A-/>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<A-/>", "<Plug>kommentary_visual_default", {})
