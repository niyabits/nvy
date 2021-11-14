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
		l = { [[<cmd>Telescope live_grep<CR>]], "Live Grep" },
		g = {
			name = "Git",
			b = { [[<cmd>Telescope git_branches<CR>]], "Git Branches" },
			s = { [[<cmd>Telescope git_status<CR>]], "Git Status" },
		},
		s = { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], "Symbols (LSP)" },
		c = { [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], "Code Actions (LSP)" },
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

wk.register({
	n = {
		name = "NPM Packages",
		s = { [[<cmd>lua require('package-info').show()<CR>]], "Show" },
		h = { [[<cmd>lua require('package-info').hide()<CR>]], "Hide" },
		u = { [[<cmd>lua require('package-info').update()<CR>]], "Update" },
		d = { [[<cmd>lua require('package-info').delete()<CR>]], "Delete" },
		i = { [[<cmd>lua require('package-info').install()<CR>]], "Install" },
		r = { [[<cmd>lua require('package-info').reinstall()<CR>]], "Reinstall" },
		c = { [[<cmd>lua require('package-info').change_version()<CR>]], "Change Version" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	b = {
		name = "Buffers",
		n = { [[<cmd>BufferLineMoveNext<CR>]], "Move Next" },
		p = { [[<cmd>BufferLineMovePrev<CR>]], "Move Prev" },
		s = { [[<cmd>BufferLineSortByDirectory<CR>]], "Sort by Directory" },
	},
}, {
	prefix = "<leader>",
})
