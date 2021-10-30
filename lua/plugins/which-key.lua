local wk = require("which-key")

-- Which Key Configuration
wk.setup({
	window = { border = "single" },
	layout = {
		spacing = 12,
		winblend = 0.5,
	},
})

wk.register({
	h = {
		name = "GitSign",
	},
}, { prefix = "<leader>" })

wk.register({
	w = {
		name = "Workspace",
	},
}, { prefix = "<leader>" })

wk.register({
	t = {
		name = "Telescope",
		g = { [[<cmd>Telescope live_grep<CR>]], "Grep" },
		s = { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], "Symbols (LSP)" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	x = {
		name = "Trouble",
		t = { [[<cmd>TroubleToggle<CR>]], "Toggle" },
	},
}, { prefix = "<leader>" })
