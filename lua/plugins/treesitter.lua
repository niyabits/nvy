require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"tsx",
		"typescript",
		"javascript",
		"graphql",
		"html",
		"css",
		"json",
		"jsonc",
		"rust",
		"go",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
